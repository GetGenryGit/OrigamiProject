using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Origami.WebComponents.Data;

public class LoginUser
{
    [Required(ErrorMessage = "Пожалуйста введите логин!"),]
    [Length(3, 30, ErrorMessage = "Логин должен быть от 3 символов до 30.")]
    public string? Login { get; set; } 

    [Required(ErrorMessage = "Пожалуйста введите пароль!")]
    [Length(8, 50, ErrorMessage = "Пароль должен быть от 8 символов до 50.")]
    [PasswordPropertyText]
    public string? Password { get; set; }
}
