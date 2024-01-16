﻿namespace Origami.WebApp.Server.Models;

public record UserDto
{
    public string? Login { get; set; }
    public string? PasswordHash { get; set; }
    public string? Email { get; set; }
    public string? Role { get; set; }
    public string? Token { get; set; }
    public DateTime Created { get; set; }
    public DateTime Expires { get; set; }
}
