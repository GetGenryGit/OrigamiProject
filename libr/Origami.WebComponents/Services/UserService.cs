using Blazored.LocalStorage;
using Blazored.SessionStorage;
using Origami.WebComponents.Abstracts.Services;
using Origami.WebComponents.Data;

namespace Origami.WebComponents.Services;

public class UserService : IUserService
{
    private readonly ILocalStorageService _localStorageService;
    public UserService(ILocalStorageService localStorageService)
        => _localStorageService = localStorageService;

    public async Task<UserDetails> GetUserDetailsAsync()
        => await _localStorageService.GetItemAsync<UserDetails>("user");

    public async Task SaveUserDetailsAsync(UserDetails user)
        => await _localStorageService.SetItemAsync("user", user);
}
