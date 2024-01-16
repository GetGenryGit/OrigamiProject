using System.Text.Json.Serialization;

namespace Origami.WebComponents.Data;

public class Tokens
{
    [JsonPropertyName("access_token")]
    public string? AccessToken { get; set; }
    [JsonPropertyName("refresh_token")]
    public string? RefreshToken { get; set; }
}
