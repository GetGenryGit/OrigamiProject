using System.Text.Json.Serialization;

namespace Origami.WebComponents.Data;

public class Chapter
{
    [JsonPropertyName("id")]
    public int ID { get; set; }
    [JsonPropertyName("name")]
    public string? Name { get; set; }
    [JsonPropertyName("chapter_index")]
    public int ChapterIndex { get; set; }
}

public class Level
{
    [JsonPropertyName("level_index")]
    public int LevelIndex { get; set; }
    [JsonPropertyName("name")]
    public string? Name { get; set; }
}

public class Step
{
    [JsonPropertyName("step_index")]
    public int StepIndex { get; set; }
    [JsonPropertyName("is_active")]
    public string? IsActive { get; set; }
    [JsonPropertyName("content")]
    public string? Content { get; set; }
    [JsonPropertyName("image_url")]
    public string? ImageUrl { get; set; }
    [JsonPropertyName("video_url")]
    public string? VideoUrl { get; set; }
}
