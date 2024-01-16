using Microsoft.AspNetCore.Components;
using Origami.WebComponents.Data;

namespace Origami.WebComponents.Abstracts.Services;

public interface IAuthService
{
    Task SignIn(LoginUser model);
    Task SignUp(RegistrationUser model, EventCallback goToLogin);
    Task Logout(string? login = null);
}
