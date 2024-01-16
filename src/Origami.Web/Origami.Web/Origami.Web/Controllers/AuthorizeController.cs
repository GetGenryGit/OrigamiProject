using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using Origami.Web.Models;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace Origami.Web.Contollers;

[ApiController]
[Route("api/[controller]")]
public class AuthorizeController : ControllerBase
{
    private readonly IConfiguration _configuration;
    private readonly string _connectionString;
    private readonly JWTSettings _jwtSettings;

    private readonly UserManager<IdentityUser> _userManager;
    private readonly SignInManager<IdentityUser> _singInManager;

    public AuthorizeController(IConfiguration configuration,
        IOptions<JWTSettings> jwtSettings)
    {
        _configuration = configuration;
        _connectionString = _configuration.GetConnectionString("PostgreConnectionString") ?? throw new Exception();
        _jwtSettings = jwtSettings.Value;
    }

    [HttpPost]
    [Route("[action]")]
    public async Task<IActionResult> Registration([FromForm]RegistrationUser registationUser)
    {
      

        return Ok();
    }

    [HttpPost]
    [Route("sign_in")]
    public async Task<IActionResult> SignIn()
    {

        return Ok();
    }

    public string GetToken()
    {
        var claims = new List<Claim>();
        claims.Add(new Claim(ClaimTypes.Name, "Ilya"));
        claims.Add(new Claim(ClaimTypes.Role, "Гость"));
        claims.Add(new Claim("level", "1"));
        claims.Add(new Claim("chapter", "1"));

        var signinKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_jwtSettings.SecretKey));

        var jwt = new JwtSecurityToken(
            issuer: _jwtSettings.Issuer,
            audience: _jwtSettings.Audience,
            claims: claims,
            expires: DateTime.UtcNow.Add(TimeSpan.FromMinutes(1)),
            notBefore: DateTime.UtcNow,
            signingCredentials: new SigningCredentials(signinKey, SecurityAlgorithms.HmacSha256)
            );

        return new JwtSecurityTokenHandler().WriteToken(jwt);

    }

}
