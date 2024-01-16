using Origami.WebComponents.Data;

namespace Origami.WebComponents.Abstracts.Services;

public interface IHttpService
{
    Task<APIResponse> Get(string uri);
    Task<APIResponse> Delete(string uri);
    Task<APIResponse> Post(string uri, object value);
    Task<APIResponse> Put(string uri, object value);
}
