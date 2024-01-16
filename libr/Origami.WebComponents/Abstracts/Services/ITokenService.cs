using Origami.WebComponents.Data;

namespace Origami.WebComponents.Abstracts.Services;
public interface ITokenService
{
    Task SaveAccessTokenAsync(string token);
    Task SaveRefreshTokenAsync(string token);
    Task<string> GetAccessTokenAsync();
    Task<string> GetRefreshTokenAsync();
    Task SignOut();
}
