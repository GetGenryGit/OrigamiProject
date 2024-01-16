using System.Text.Json.Serialization;

namespace Origami.WebComponents.Data;

public record APIResponse
{
    [JsonPropertyName("result")]
    public bool Result { get; set; }
    [JsonPropertyName("message")]
    public string Message { get; set; }
    [JsonPropertyName("obj")]
    public object Obj { get; set; }
}
