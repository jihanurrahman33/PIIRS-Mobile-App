/// Contract for providing authentication bearer tokens dynamically to the HTTP client.
abstract class AuthTokenProvider {
  /// Fetches the current user's ID/JWT token.
  /// Returns `null` if the user is unauthenticated or token retrieval fails.
  Future<String?> getAuthToken();
}
