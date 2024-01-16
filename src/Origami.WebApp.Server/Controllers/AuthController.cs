using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Npgsql;
using Origami.WebApp.Server.Models;
using Origami.WebApp.Server.Services;
using Origami.WebComponents.Data;
using RestSharp;
using System.Data;

namespace Origami.WebApp.Server.Contollers;

[ApiController]
[Route("api/[controller]")]
public class AuthController : ControllerBase
{
    private readonly IConfiguration _configuration;
    private readonly string _connectionString;
    private readonly IJWTService _jwtService ;

    public AuthController(IConfiguration configuration,
        IJWTService jwtService)
    {
        _configuration = configuration;
        _connectionString = _configuration.GetConnectionString("PostgreConnectionString") ?? throw new Exception();
        _jwtService = jwtService;
    }

    [HttpPost]
    [Route("sign_up")]
    public async Task<IActionResult> SignUp([FromBody]RegistrationUser user)
    {
        var response = new APIResponse();
        var dt = new DataTable();

        try
        {
            using (var conn = new NpgsqlConnection(_connectionString))
            {
                conn.Open();

                string query = "SELECT * FROM users " +
                               "WHERE login = @login or email = @email";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@login", user.Login);
                    cmd.Parameters.AddWithValue("@email", user.Email);

                    NpgsqlDataReader dataReader = cmd.ExecuteReader();
                    dt.Load(dataReader);
                }

                if (dt.Rows.Count > 0)
                {
                    response.Message = "Данный логин или почта уже есть у другого пользователя!";                 
                    return Ok(response);
                }

                query = "INSERT INTO users(login, pass, email, role_id) " +
                        "VALUES " +
                        "( " +
                        "@login, " +
                        "@pass, " +
                        "@email, " +
                        "(SELECT id FROM roles WHERE title = 'Гость') " +
                        "); " +
                        "INSERT INTO users_progress(user_id, opened_last_chapter, opened_last_level) " +
                        "VALUES " +
                        "( " +
                        "(SELECT id FROM users WHERE login = @login)," +
                        "(SELECT id FROM chapters WHERE chapter_index = 1), " +
                        "(SELECT id FROM levels WHERE level_index = 1 and chapter_id = (SELECT id FROM chapters WHERE chapter_index = 1)) " +
                        "); ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@login", user.Login);
                    cmd.Parameters.AddWithValue("@pass", user.Password);
                    cmd.Parameters.AddWithValue("@email", user.Email);

                    cmd.ExecuteNonQuery();  
                }

                response.Result = true;
                response.Message = "Пользователь успешно зарегистрирован!";

                return new ObjectResult(response) { StatusCode = 201};
            }
        }
        catch (Exception ex) 
        {
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера!";
#endif
            return new ObjectResult(response) { StatusCode = 500 };
        }
    }

    [HttpPost]
    [Route("sign_in")]
    public async Task<IActionResult> SignIn([FromBody]LoginUser user)
    {
        var response = new APIResponse();
        var dt = new DataTable();
        var userDto = new UserDto();

        try
        {
            using (var conn = new NpgsqlConnection(_connectionString))
            {
                conn.Open();

                string query = "SELECT login, email, " +
                               "(SELECT title FROM roles WHERE id = role_id) as role " +
                               "FROM users " +
                               "WHERE login = @login and pass = @pass;";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@login", user.Login);
                    cmd.Parameters.AddWithValue("@pass", user.Password);

                    NpgsqlDataReader dataReader = cmd.ExecuteReader();
                    dt.Load(dataReader);
                }

                if (dt.Rows.Count < 1)
                {
                    response.Message = "Неправильный логин или пароль!";

                    return Ok(response);
                }

                foreach (DataRow userRow in dt.Rows)
                {
                    userDto.Login = (string)userRow["login"];
                    userDto.Email = (string)userRow["email"];
                    userDto.Role = (string)userRow["role"];
                }
            }

            var accessToken = _jwtService.GenerateAccessToken(userDto);
            var refreshToken = _jwtService.GenerateRefreshToken();

            _jwtService.UpdateRefreshJWT(refreshToken, userDto);

            var tokens = new Tokens
            {
                AccessToken = accessToken,
                RefreshToken = refreshToken.Token,
            };

            response.Result = true;
            response.Message = "Пользователь успешно авторизован!";
            response.Obj = tokens;

            return Ok(response);
        }
        catch (Exception ex)
        {
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера!";
#endif
            return new ObjectResult(response) { StatusCode = 500 };
        }

    }

    [Authorize]
    [HttpGet]
    [Route("get_user_details")]
    public async Task<IActionResult> GetUserDetails(string login)
    {
        var response = new APIResponse();
        var dt = new DataTable();
        var userDto = new UserDto();

        try
        {
            using (var conn = new NpgsqlConnection(_connectionString))
            {
                conn.Open();

                string query = "SELECT login, email, " +
                               "(SELECT title FROM roles WHERE id = role_id) as role " +
                               "FROM users " +
                               "WHERE login = @login; ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@login", login);

                    NpgsqlDataReader dataReader = cmd.ExecuteReader();
                    dt.Load(dataReader);
                }

                if (dt.Rows.Count < 1)
                {
                    response.Message = "Такого токена не существует!";
                    return Ok(response);
                }

                foreach (DataRow userRow in dt.Rows)
                {
                    userDto.Login = (string)userRow["login"];
                    userDto.Email = (string)userRow["email"];
                    userDto.Role = (string)userRow["role"];
                }
            }

            var userDetails = new UserDetails
            {
                Login = userDto.Login,
                Email = userDto.Email,
                Role = userDto.Role
            };

            response.Result = true;
            response.Message = "Пользователь успешно получил о себе информацию!";
            response.Obj = userDetails;

            return Ok(response);
        }
        catch (Exception ex)
        {
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера!";
#endif
            return new ObjectResult(response) { StatusCode = 500 };
        }
    }
  
    [HttpPost]
    [Route("refresh_token")]
    public async Task<IActionResult> RefreshToken([FromBody] Tokens refreshToken)
    {
        var response = new APIResponse();
        var dt = new DataTable();
        var userDto = new UserDto();

        if (string.IsNullOrWhiteSpace(refreshToken.RefreshToken))
        {
            response.Message = "Токен не может быть пустым";

            return Unauthorized(response);
        }

        try
        {
            using (var conn = new NpgsqlConnection(_connectionString))
            {
                conn.Open();

                string query = "SELECT login, email, " +
                               "(SELECT title FROM roles WHERE id = role_id) as role, " +
                               "refresh_token, refresh_token_expires " +
                               "FROM users " +
                               "WHERE refresh_token = @refresh_token; ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@refresh_token", refreshToken.RefreshToken);

                    NpgsqlDataReader dataReader = cmd.ExecuteReader();
                    dt.Load(dataReader);
                }

                if (dt.Rows.Count < 1)
                {
                    response.Message = "Данного токена не существует!";

                    return Unauthorized(response);
                }

                foreach (DataRow userRow in dt.Rows)
                {
                    userDto.Login = (string)userRow["login"];
                    userDto.Email = (string)userRow["email"];
                    userDto.Role = (string)userRow["role"];

                    userDto.Token = (string)userRow["refresh_token"];
                    userDto.Expires = (DateTime)userRow["refresh_token_expires"];
                }
            }

            if (userDto.Expires < DateTime.Now)
            {
                response.Message = "Время существования токена истекло! Необходимо заново пройти Авторизацию!";
                return Unauthorized(response);
            }

            var tokenDetails = _jwtService.GenerateAccessToken(userDto);

            response.Message = "Токен успешно обновлен!";
            response.Obj = tokenDetails;

            return Ok(response);
        }
        catch (Exception ex)
        {
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера!";
#endif
            return new ObjectResult(response) { StatusCode = 500 };
        }

    }

    [Authorize]
    [HttpDelete]
    [Route("revoke_token/{login}")]
    public async Task<IActionResult> RevokeToken(string login)
    {
        var response = new APIResponse();

        try
        {
            using (var conn = new NpgsqlConnection(_connectionString))
            {
                conn.Open();

                string query = "UPDATE users " +
                               "SET refresh_token = null," +
                               "refresh_token_created = null," +
                               "refresh_token_expires = null " +
                               "WHERE login = @login";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@login", login);

                    cmd.ExecuteNonQuery();
                }
            }

            response.Result = true;
            response.Message = "Токен успешно отозван!";

            return Ok(response);
        }
        catch (Exception ex)
        {
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера!";
#endif
            return new ObjectResult(response) { StatusCode = 500 };
        }
    }
}
