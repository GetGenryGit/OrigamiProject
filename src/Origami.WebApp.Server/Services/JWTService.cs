using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using Npgsql;
using Origami.WebApp.Server.Models;
using Origami.WebComponents.Data;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;

namespace Origami.WebApp.Server.Services;

public class JWTService : IJWTService
{
    private readonly JWTSettings _jwtOptions;
    private readonly string _connectionString;
    private readonly IConfiguration _configuration;

    public JWTService(IOptions<JWTSettings> options, IConfiguration configuration)
    {
        _configuration = configuration;
        _jwtOptions = options.Value ?? throw new ArgumentException(nameof(options));
        _connectionString = _configuration.GetConnectionString("PostgreConnectionString") ?? throw new Exception();
    }

    public string GenerateAccessToken(UserDto user)
    {
        ArgumentNullException.ThrowIfNull(user);

        var key = Encoding.ASCII.GetBytes(_jwtOptions.SecretKey);
        var securityKey = new SymmetricSecurityKey(key);

        var tokenDescriptor = new SecurityTokenDescriptor
        {
            Subject = new ClaimsIdentity(new[]
            {
                new Claim(ClaimTypes.Name, user.Login),
                new Claim(ClaimTypes.Email, user.Email),
                new Claim(ClaimTypes.Role, user.Role)
            }),
            Expires = DateTime.UtcNow.AddMinutes(5),
            Issuer = _jwtOptions.Issuer,
            Audience = _jwtOptions.Audience,
            SigningCredentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256Signature),
        };
        var tokenHandler = new JwtSecurityTokenHandler();
        var token = tokenHandler.CreateToken(tokenDescriptor);

        var encrypterToken = tokenHandler.WriteToken(token);

        return encrypterToken;
    }

    public RefreshToken GenerateRefreshToken()
    {
        var refreshToken = new RefreshToken()
        {
            Token = Convert.ToBase64String(RandomNumberGenerator.GetBytes(64)),
            Expires = DateTime.Now.AddMonths(6),
            Created = DateTime.Now
        };

        return refreshToken;
    }

    public void UpdateRefreshJWT(RefreshToken refreshToken, UserDto user)
    {
        using (var conn = new NpgsqlConnection(_connectionString))
        {
            conn.Open();

            string query = "UPDATE users " +
                           "SET refresh_token = @refresh_token, " +
                           "refresh_token_created = @refresh_token_created, " +
                           "refresh_token_expires = @refresh_token_expires " +
                           "WHERE login = @login; ";
            using (var cmd = new NpgsqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@refresh_token", refreshToken.Token);
                cmd.Parameters.AddWithValue("@refresh_token_created", refreshToken.Created);
                cmd.Parameters.AddWithValue("@refresh_token_expires", refreshToken.Expires);
                cmd.Parameters.AddWithValue("@login", user.Login);

                cmd.ExecuteNonQuery();
            }
        }
    }
}