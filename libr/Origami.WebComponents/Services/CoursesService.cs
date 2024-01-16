using Blazored.LocalStorage;
using Blazored.Toast.Services;
using Origami.WebComponents.Abstracts.Services;
using Origami.WebComponents.Constants;
using Origami.WebComponents.Data;
using System.Net;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Text.Json;

namespace Origami.WebComponents.Services;

public class CoursesService : ICoursesService
{
    private readonly IToastService _toastService;
    private readonly IHttpService _httpService;
    public CoursesService(IToastService toastService,
        IHttpService httpService)
    {
        _toastService = toastService;
        _httpService = httpService;
    }
    

    public async Task<bool> UpdateUserProgress(string uri, object value)
    {
        var responseContent = await _httpService.Put(APIConstants.UpdateUserProgress, value);
        if (!responseContent.Result)
        {
            _toastService.ShowError(responseContent.Message);
            return false;
        }
        _toastService.ShowSuccess(responseContent.Message);
        return true;
    }

    public async Task<T> GetContent<T>(string uri, string value)
    {
        var responseContent = await _httpService.Get(uri + value);
        if (responseContent == null)
            return default;

        if (!responseContent.Result)
        {
            _toastService.ShowError(responseContent.Message);
            return default;
        }

        var list = JsonSerializer.Deserialize<T>(responseContent.Obj.ToString());
        return list; 
    }

}
        
