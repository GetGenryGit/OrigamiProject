using Origami.WebApp.Server.Models;
using Origami.WebComponents.Data;

namespace Origami.WebApp.Server.Services;

public interface IJWTService
{
    string GenerateAccessToken(UserDto user);
    RefreshToken GenerateRefreshToken();
    void UpdateRefreshJWT(RefreshToken refreshToken, UserDto user);
}

