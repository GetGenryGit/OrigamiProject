using Blazored.LocalStorage;
using Microsoft.AspNetCore.Components;
using Origami.WebComponents.Abstracts.Services;
using System.Text.Json;
using System.Text;
using System.Net.Http.Headers;
using System.Net;
using Origami.WebComponents.Data;
using Origami.WebComponents.Constants;
using System.Net.Http.Json;

namespace Origami.WebComponents.Services;

public class HttpService : IHttpService
{
    private readonly HttpClient _httpClient;
    private readonly NavigationManager _navigationManager;
    private readonly ITokenService _tokenService;
    public HttpService(HttpClient httpClient, NavigationManager navigationManager,
        ITokenService tokenService)
    {
        _httpClient = httpClient;
        _navigationManager = navigationManager;
        _tokenService = tokenService;
    }
    public async Task<APIResponse> Delete(string uri)
    {
        var request = new HttpRequestMessage(HttpMethod.Delete, uri);
        return await sendRequest(request);
    }

    public async Task<APIResponse> Get(string uri)
    {
        var request = new HttpRequestMessage(HttpMethod.Get, uri);
        return await sendRequest(request);
    }

    public async Task<APIResponse> Post(string uri, object value)
    {
        var request = new HttpRequestMessage(HttpMethod.Post, uri);
        request.Content = new StringContent(JsonSerializer.Serialize(value), Encoding.UTF8, "application/json");
        return await sendRequest(request);
    }

    public async Task<APIResponse> Put(string uri, object value)
    {
        var request = new HttpRequestMessage(HttpMethod.Put, uri);
        request.Content = new StringContent(JsonSerializer.Serialize(value), Encoding.UTF8, "application/json");
        return await sendRequest(request);
    }
    private async Task<APIResponse> sendRequest(HttpRequestMessage request)
    {
        // get jwt access token if user authorized
        var accessToken = await _tokenService.GetAccessTokenAsync();
        if (accessToken != null)
            request.Headers.Authorization = new AuthenticationHeaderValue("Bearer", accessToken);

        var response = await _httpClient.SendAsync(request);
        // user didnt authorized or access token is expired
        if (response.StatusCode == HttpStatusCode.Unauthorized)
        {
            var refreshToken = await _tokenService.GetRefreshTokenAsync();
            // user dont have access token
            if (refreshToken == null)
            {
                await _tokenService.SignOut();
                _navigationManager.NavigateTo("/authorization");
                return default;
            }

            using var responseRefreshAccessToken = await _httpClient.PostAsJsonAsync(APIConstants.RefreshToken, new { refresh_token = refreshToken});
            // refresh token is expired
            if (responseRefreshAccessToken.StatusCode == HttpStatusCode.Unauthorized)
            {
                await _tokenService.SignOut();
                _navigationManager.NavigateTo("/authorization");
                return default;
            }

            if (!responseRefreshAccessToken.IsSuccessStatusCode)
            {
                var error = await responseRefreshAccessToken.Content.ReadFromJsonAsync<Dictionary<string, string>>();
                throw new Exception(error["message"]);
            }

            var responseRefreshAccessTokenContent = await responseRefreshAccessToken.Content.ReadFromJsonAsync<APIResponse>();
            accessToken = responseRefreshAccessTokenContent.Obj.ToString();
            await _tokenService.SaveAccessTokenAsync(accessToken);

            var newRequest = new HttpRequestMessage(request.Method, request.RequestUri);

            newRequest.Headers.Authorization = new AuthenticationHeaderValue("Bearer", accessToken);

            response = await _httpClient.SendAsync(newRequest);
        }

        if (!response.IsSuccessStatusCode)
        {
            var error = await response.Content.ReadFromJsonAsync<Dictionary<string, string>>();
            throw new Exception(error["message"]);
        }

        return await response.Content.ReadFromJsonAsync<APIResponse>();
    }

}
