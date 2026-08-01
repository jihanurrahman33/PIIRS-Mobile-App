/// Contract for checking internet connection status.
abstract class NetworkInfo {
  /// Returns `true` if internet connection is currently available.
  Future<bool> get isConnected;
}

/// Simple default implementation of [NetworkInfo].
class SimpleNetworkInfo implements NetworkInfo {
  @override
  Future<bool> get isConnected async {
    try {
      final result = Uri.parse('https://1.1.1.1').host;
      return result.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}
