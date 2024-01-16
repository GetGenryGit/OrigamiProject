using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Npgsql;
using Origami.WebComponents.Data;
using System.Data;

namespace Origami.WebApp.Server.Contollers;

[ApiController]
[Route("api/[controller]")]
[Authorize]
public class CoursesController : ControllerBase
{
    private readonly IConfiguration _configuration;
    private string _connectionString;

    public CoursesController(IConfiguration configuration)
    {
        _configuration = configuration;
        _connectionString = _configuration.GetConnectionString("PostgreConnectionString") ?? throw new Exception();
    }

    // GET: api/courses/get_chapters
    [HttpGet]
    [Route("get_chapters")]
    public IActionResult GetChapters(string login)
    {
        var response = new APIResponse();
        var dt = new DataTable();

        var list = new List<Chapter>();

        try
        {
            using (var conn = new NpgsqlConnection(_connectionString))
            {
                conn.Open();

                string query = "SELECT " +
                               "id, name, chapter_index " +
                               "FROM chapters " +
                               "WHERE " +
                               "id <= (SELECT opened_last_chapter FROM users_progress WHERE user_id = (SELECT id FROM users WHERE login = @login)) " +
                               "ORDER BY chapter_index ASC; ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@login", login);

                    NpgsqlDataReader dataReader = cmd.ExecuteReader();
                    dt.Load(dataReader);
                }

                if (dt.Rows.Count < 1)
                {
                    response.Message = "Главы не найдены в базе данных!";
                    response.Obj = list;

                    return Ok(response);
                }

                foreach (DataRow chapter in dt.Rows) 
                {
                    list.Add(new()
                    {
                        ID = (int)chapter["id"],
                        Name = (string)chapter["name"], 
                        ChapterIndex = (int)chapter["chapter_index"]
                    });
                }
                
            }

            response.Result = true;
            response.Message = "Главы успешно получены!";
            response.Obj = list;

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

    // GET: api/courses/get_levels
    [HttpGet]
    [Route("get_levels")]
    public IActionResult GetLevels(string chapter, string login)
    {
        var response = new APIResponse(); 
        var dt = new DataTable();

        var list = new List<Level>();

        try
        {
            using (var conn = new NpgsqlConnection(_connectionString))
            {
                conn.Open();

                string query = "SELECT " +
                               "level_index, name " +
                               "FROM levels " +
                               "WHERE " +
                               "chapter_id = (SELECT id FROM chapters WHERE name = @name) " +
                               "AND " +
                               "id <= (SELECT opened_last_level FROM users_progress WHERE user_id = (SELECT id FROM users WHERE login = @login))" +
                               "ORDER BY level_index ASC; ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@login", login);
                    cmd.Parameters.AddWithValue("@name", chapter);

                    NpgsqlDataReader dataReader = cmd.ExecuteReader();
                    dt.Load(dataReader);
                }

                if (dt.Rows.Count < 1)
                {
                    response.Message = $"Уровни для главы {chapter} не найдены в базе данных!";
                    response.Obj = list;
                    return Ok(response);
                }

                foreach (DataRow level in dt.Rows)
                {
                    list.Add(new()
                    {
                        LevelIndex = (int)level["level_index"],
                        Name = (string)level["name"],
                    });
                }

            }

            response.Result = true;
            response.Message = $"Уровни к главе {chapter} успешно получены!";
            response.Obj = list;

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

    // GET: api/courses/get_steps
    [HttpGet]
    [Route("get_steps")]
    public IActionResult GetSteps(string level, string login) 
    {
        var response = new APIResponse();
        var dt = new DataTable();

        var list = new List<Step>();

        try
        {
            using (var conn = new NpgsqlConnection(_connectionString))
            {
                conn.Open();

                string query = "SELECT " +
                               "step_index, content, image_url, video_url " +
                               "FROM steps " +
                               "WHERE level_id = (SELECT id FROM levels WHERE name = @name) " +
                               "ORDER by step_index ASC; ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@name", level);

                    NpgsqlDataReader dataReader = cmd.ExecuteReader();
                    dt.Load(dataReader);
                }

                if (dt.Rows.Count < 1)
                {
                    response.Message = $"Уровни для главы {level} не найдены в базе данных!";

                    return Ok(response);
                }

                bool isFirstStep = true;

                foreach (DataRow step in dt.Rows)
                {
                    list.Add(new()
                    {
                        StepIndex = (int)step["step_index"],
                        IsActive = isFirstStep ? "active" : null,
                        Content = !string.IsNullOrEmpty(step["content"].ToString()) ? step["content"].ToString() : null,
                        ImageUrl = !string.IsNullOrEmpty(step["image_url"].ToString()) ? step["image_url"].ToString() : null,
                        VideoUrl = !string.IsNullOrEmpty(step["video_url"].ToString()) ? step["video_url"].ToString() : null
                    });

                    isFirstStep = false;
                }

            }

            response.Result = true;
            response.Message = "Курсы успешно получены!";
            response.Obj = list;

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

    // POST: api/courses/update_user_progress
    [Authorize]
    [HttpPut]
    [Route("update_user_progress")]
    public IActionResult UpdateUserProgress([FromBody] ContentParameter content)
    {
        var response = new APIResponse();
        var dt = new DataTable();
        string lastOpenedLevel = "";

        try
        {
            using (var conn = new NpgsqlConnection(_connectionString))
            {
                conn.Open();

                // check is last level opening
                string query = "SELECT name FROM levels WHERE " +
                               "id = (SELECT opened_last_level FROM users_progress WHERE user_id = " +
                               "(SELECT id FROM users WHERE login = @login)); ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@login", content.Login);

                    NpgsqlDataReader dataReader = cmd.ExecuteReader();
                    dt.Load(dataReader);
                }

                foreach (DataRow row in dt.Rows)
                    lastOpenedLevel = row["name"].ToString();

                if (lastOpenedLevel != content.Level)
                {
                    response.Message = "Уровень не будет открыт! Он был открыт ранее!";
                    response.Obj = lastOpenedLevel;

                    return new ObjectResult(response) { StatusCode = 200 };
                }

                // query update opened_last_level
                query = "UPDATE users_progress " +
                        "SET opened_last_level = " +
                        "(SELECT (opened_last_level + 1) FROM users_progress WHERE " +
                        "user_id = (SELECT id FROM users WHERE login = @login)); ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@login", content.Login);

                    cmd.ExecuteNonQuery();
                }

                // check chapter is need update
                query = "SELECT * FROM levels WHERE " +
                        "id = " +
                        "(SELECT id + 1 FROM levels WHERE name = @level) and " +
                        "chapter_id = " +
                        "(SELECT chapter_id + 1 FROM levels WHERE name = @level);";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@level", content.Level);

                    NpgsqlDataReader dataReader = cmd.ExecuteReader();
                    dt.Load(dataReader);
                }

                if (dt.Rows.Count > 1)
                {
                    // query update opened_last_chapter
                    query = "UPDATE users_progress " +
                            "SET opened_last_chapter = " +
                            "(SELECT (opened_last_chapter + 1) FROM users_progress WHERE " +
                            "user_id = (SELECT id FROM users WHERE login = @login)); ";

                    using (var cmd = new NpgsqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@login", content.Login);

                        cmd.ExecuteNonQuery();
                    }

                    response.Result = true;
                    response.Message = $"Следующий уровень и глава успешно открыт!";

                    return Ok(response);
                }

            }

            response.Result = true;
            response.Message = $"Следующий уровень успешно открыт!";

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
