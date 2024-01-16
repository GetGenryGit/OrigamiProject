using System.Text.Json.Serialization;

namespace Origami.WebComponents.Data;

public record UserDetails
{
    [JsonPropertyName("login")]
    public string Login { get; set; }
    [JsonPropertyName("email")]
    public string Email { get; set; }
    [JsonPropertyName("role")]
    public string Role { get; set; }    
}
