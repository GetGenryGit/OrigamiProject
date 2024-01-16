using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Origami.WebComponents.Data;

public class RegistrationUser : LoginUser
{
    [Required(ErrorMessage = "Пожалуйста введите почту!")]
    [Length(4, 64, ErrorMessage = "Эл. почта должна быть от 4 символов до 64.")]
    [EmailAddress(ErrorMessage = "Введите валидную почту!")]
    public string? Email { get; set; }
}
