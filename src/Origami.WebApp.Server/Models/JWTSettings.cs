namespace Origami.WebApp.Server.Models;

public record JWTSettings 
{
    public string? SecretKey { get; set; }
    public string? Issuer { get; set; }
    public string? Audience { get; set; }
}
