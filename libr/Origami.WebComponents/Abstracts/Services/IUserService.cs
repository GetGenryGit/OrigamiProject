using Origami.WebComponents.Data;

namespace Origami.WebComponents.Abstracts.Services;

public interface IUserService
{
    Task SaveUserDetailsAsync(UserDetails user);
    Task<UserDetails> GetUserDetailsAsync();
}
