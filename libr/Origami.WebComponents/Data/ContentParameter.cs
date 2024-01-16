using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Origami.WebComponents.Data;

public class ContentParameter
{
    public ContentParameter(string login, string level)
    {
        Login = login;
        Level = level;
    }
    [JsonPropertyName("login")]
    public string Login { get; set; }
    [JsonPropertyName("level")]
    public string Level { get; set; }
}
