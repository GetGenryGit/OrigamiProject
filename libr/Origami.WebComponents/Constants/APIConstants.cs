namespace Origami.WebComponents.Constants;

public static class APIConstants
{
    public static string SignIn = "/api/auth/sign_in";
    public static string SignUp = "/api/auth/sign_up";

    public static string GetUserDetails = "/api/auth/get_user_details";

    public static string RefreshToken = "/api/Auth/refresh_token";
    public static string RevokeToken = "/api/Auth/revoke_token";

    public static string GetChapters = "/api/courses/get_chapters";
    public static string GetLevels = "/api/courses/get_levels";
    public static string GetSteps = "/api/courses/get_steps";

    public static string UpdateUserProgress = "/api/courses/update_user_progress";


}
