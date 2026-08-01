/// Global Environment Configuration manager.
/// Uses `--dart-define` compilation flags for dynamic environment variable injection.
abstract class EnvConfig {
  /// Base API URL.
  /// Can be overridden at build time via `--dart-define=ZAPSHIFT_BASE_URL=https://...`
  static const String baseUrl = String.fromEnvironment(
    'ZAPSHIFT_BASE_URL',
    defaultValue:
        'https://public-infrastructure-issue-reporti-pearl.vercel.app',
  );

  /// Stripe Publishable Key.
  /// Can be overridden at build time via `--dart-define=ZAPSHIFT_STRIPE_KEY=pk_test_...`
  static const String stripePublishableKey = String.fromEnvironment(
    'ZAPSHIFT_STRIPE_KEY',
    defaultValue: '',
  );

  /// Current environment name: 'dev', 'staging', or 'prod'.
  static const String environment = String.fromEnvironment(
    'ZAPSHIFT_ENV',
    defaultValue: 'dev',
  );

  /// Helper flag checking if app is running in production mode.
  static bool get isProduction => environment == 'prod';

  /// Helper flag checking if app is running in development mode.
  static bool get isDevelopment => environment == 'dev';
}
