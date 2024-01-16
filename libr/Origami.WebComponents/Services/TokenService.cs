using Blazored.LocalStorage;
using Blazored.SessionStorage;
using Origami.WebComponents.Abstracts.Services;
using Origami.WebComponents.Data;

namespace Origami.WebComponents.Services;

public class TokenService : ITokenService
{
    private readonly ILocalStorageService _localStorageService;
    public TokenService(ILocalStorageService localStorageService)
        => _localStorageService = localStorageService;

    public async Task<string> GetAccessTokenAsync()
        => await _localStorageService.GetItemAsStringAsync("access_token");

    public async Task<string> GetRefreshTokenAsync()
        => await _localStorageService.GetItemAsStringAsync("refresh_token");

    public async Task SaveAccessTokenAsync(string token)
        => await _localStorageService.SetItemAsStringAsync("access_token", token);

    public async Task SaveRefreshTokenAsync(string token)
        => await _localStorageService.SetItemAsStringAsync("refresh_token", token);

    public async Task SignOut()
        => await _localStorageService.ClearAsync();
}
