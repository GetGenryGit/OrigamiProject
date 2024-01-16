using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Npgsql;
using Origami.WebComponents.Data;
using System.Data;

namespace Origami.Web.Contollers;

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
    public IActionResult GetChapters()
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
                               "ORDER BY chapter_index ASC; ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    NpgsqlDataReader dataReader = cmd.ExecuteReader();
                    dt.Load(dataReader);
                }

                if (dt.Rows.Count < 1)
                {
                    response.Result = true;
                    response.Message = "Главы не найдены в базе данных!";

                    response.obj = list;

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

            response.obj = list;

            return Ok(response);
        }
        catch (Exception ex) 
        {
            response.Result = false;
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера!";
#endif
            return BadRequest(response);
        }


    }

    // GET: api/courses/get_levels
    [HttpGet]
    [Route("get_levels")]
    public IActionResult GetLevels(string chapter)
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
                               "WHERE chapter_id = (SELECT id FROM chapters WHERE name = @name)" +
                               "ORDER BY level_index ASC; ";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@name", chapter);

                    NpgsqlDataReader dataReader = cmd.ExecuteReader();
                    dt.Load(dataReader);
                }

                if (dt.Rows.Count < 1)
                {
                    response.Result = true;
                    response.Message = $"Уровни для главы {chapter} не найдены в базе данных!";

                    response.obj = list;

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

            response.obj = list;

            return Ok(response);
        }
        catch (Exception ex)
        {
            response.Result = false;
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера!";
#endif
            return BadRequest(response);
        }
    }

    // GET: api/courses/get_steps
    [HttpGet]
    [Route("get_steps")]
    public IActionResult GetSteps(string level) 
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
                    response.Result = true;
                    response.Message = $"Уровни для главы {level} не найдены в базе данных!";

                    response.obj = list;

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

            response.obj = list;

            return Ok(response);
        }
        catch (Exception ex)
        {
            response.Result = false;
#if DEBUG
            response.Message = ex.Message;
#else
            response.Message = "Произошла ошибка на стороне сервера!";
#endif
            return BadRequest(response);
        }

    }
}
