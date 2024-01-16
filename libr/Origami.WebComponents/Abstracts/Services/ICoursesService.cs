using Origami.WebComponents.Data;

namespace Origami.WebComponents.Abstracts.Services;

public interface ICoursesService
{
    Task<bool> UpdateUserProgress(string uri, object value);
    Task<T> GetContent<T>(string uri, string value);
}
