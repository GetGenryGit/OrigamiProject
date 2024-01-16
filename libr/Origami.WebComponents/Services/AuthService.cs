using Microsoft.AspNetCore.Components;
using Origami.WebComponents.Abstracts.Services;
using Origami.WebComponents.Constants;
using Origami.WebComponents.Data;
using Blazored.Toast.Services;
using System.Text.Json;

namespace Origami.WebComponents.Services;

public class AuthService : IAuthService
{
    private readonly IHttpService _httpService;
    private readonly NavigationManager _navigationManager;
    private readonly IToastService _toastService;
    private readonly ITokenService _tokenService;
    private readonly IUserService _userService;
    public AuthService(IHttpService httpService,
        NavigationManager navigationManager, IToastService toastService, 
        ITokenService tokenService, IUserService userService)
    {
        _httpService = httpService;
        _navigationManager = navigationManager;
        _toastService = toastService;
        _tokenService = tokenService;
        _userService = userService;
    }

    public async Task SignIn(LoginUser model)
    {
        var responseContent = await _httpService.Post(APIConstants.SignIn, model);

        if (responseContent == null)
        {
            _toastService.ShowError("Произошла ошибка на стороне сервера");
            return;
        }

        if (!responseContent.Result)
        {
            _toastService.ShowError(responseContent.Message);
            return;
        }

        var tokens = JsonSerializer.Deserialize<Tokens>(responseContent.Obj.ToString());
        await _tokenService.SaveAccessTokenAsync(tokens.AccessToken);
        await _tokenService.SaveRefreshTokenAsync(tokens.RefreshToken);

        var userDetails = await GetUserDetails(model.Login);
        if (userDetails == null)
            throw new Exception(nameof(userDetails));
        await _userService.SaveUserDetailsAsync(userDetails);

        _navigationManager.NavigateTo("/home", true, true);
    }


    public async Task SignUp(RegistrationUser model, EventCallback goToLogin)
    {
        var responseContent = await _httpService.Post(APIConstants.SignUp, model);

        if (responseContent == null)
        {
            _toastService.ShowError("Произошла ошибка на стороне сервера");
            return;
        }

        if (!responseContent.Result)
        {
            _toastService.ShowError(responseContent.Message);
            return;
        }

        await goToLogin.InvokeAsync();
        _toastService.ShowSuccess(responseContent.Message);
    }

    public async Task Logout(string? login = null)
    {
        if (string.IsNullOrWhiteSpace(login))
        {
            await _tokenService.SignOut();
            _navigationManager.NavigateTo("/authorization", true, true);
            return;
        }

        var responseContent = await _httpService.Delete(APIConstants.RevokeToken + "/" + login);

        if (responseContent == null)
        {
            _toastService.ShowError("Произошла ошибка на стороне сервера");
            return;
        }

        if (!responseContent.Result)
        {
            _toastService.ShowError(responseContent.Message);
            return;
        }

        _toastService.ShowSuccess(responseContent.Message);
        await _tokenService.SignOut();
        _navigationManager.NavigateTo("/authorization", true, true);
    }

    private async Task<UserDetails> GetUserDetails(string login)
    {
        var responseContent = await _httpService.Get(APIConstants.GetUserDetails + "?login=" + login);

        if (responseContent == null)
        {
            _toastService.ShowError("Произошла ошибка на стороне сервера");
            return default;
        }

        if (!responseContent.Result)
            return default;
        return JsonSerializer.Deserialize<UserDetails>(responseContent.Obj.ToString());
    }
}
