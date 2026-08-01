import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/account_blocked_page.dart';
import '../../features/auth/presentation/pages/app_update_page.dart';
import '../../features/auth/presentation/pages/email_verification_page.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/maintenance_page.dart';
import '../../features/auth/presentation/pages/onboarding_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/auth/presentation/pages/welcome_page.dart';
import '../../features/home/presentation/pages/home_page.dart';

/// Centralized GoRouter navigation configuration.
abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: '/welcome',
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: '/verify-email',
        builder: (context, state) => const EmailVerificationPage(),
      ),
      GoRoute(
        path: '/account-blocked',
        builder: (context, state) => const AccountBlockedPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/update',
        builder: (context, state) => const AppUpdatePage(),
      ),
      GoRoute(
        path: '/maintenance',
        builder: (context, state) => const MaintenancePage(),
      ),
    ],
  );
}
