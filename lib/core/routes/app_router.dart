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
import '../../features/home/presentation/pages/citizen_main_shell.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/issue_categories_page.dart';
import '../../features/home/presentation/pages/notifications_page.dart';
import '../../features/home/presentation/pages/search_issues_page.dart';
import '../../features/issues/presentation/pages/all_issues_page.dart';
import '../../features/issues/presentation/pages/assigned_issues_page.dart';
import '../../features/issues/presentation/pages/explore_issues_page.dart';
import '../../features/issues/presentation/pages/image_gallery_page.dart';
import '../../features/issues/presentation/pages/image_preview_page.dart';
import '../../features/issues/presentation/pages/issue_comments_page.dart';
import '../../features/issues/presentation/pages/issue_details_page.dart';
import '../../features/issues/presentation/pages/issue_timeline_page.dart';
import '../../features/issues/presentation/pages/latest_issues_page.dart';
import '../../features/issues/presentation/pages/location_picker_page.dart';
import '../../features/issues/presentation/pages/my_issues_page.dart';
import '../../features/issues/presentation/pages/pending_issues_page.dart';
import '../../features/issues/presentation/pages/rejected_issues_page.dart';
import '../../features/issues/presentation/pages/report_issue_page.dart';
import '../../features/issues/presentation/pages/report_success_page.dart';
import '../../features/issues/presentation/pages/resolved_issues_page.dart';
import '../../features/issues/presentation/pages/trending_issues_page.dart';
import '../../features/profile/presentation/pages/citizen_profile_page.dart';

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
        path: '/update',
        builder: (context, state) => const AppUpdatePage(),
      ),
      GoRoute(
        path: '/maintenance',
        builder: (context, state) => const MaintenancePage(),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => const SearchIssuesPage(),
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationsPage(),
      ),
      GoRoute(
        path: '/categories',
        builder: (context, state) => const IssueCategoriesPage(),
      ),

      // Issue Module Routes
      GoRoute(
        path: '/issues/all',
        builder: (context, state) => const AllIssuesPage(),
      ),
      GoRoute(
        path: '/issues/latest',
        builder: (context, state) => const LatestIssuesPage(),
      ),
      GoRoute(
        path: '/issues/trending',
        builder: (context, state) => const TrendingIssuesPage(),
      ),
      GoRoute(
        path: '/issues/resolved',
        builder: (context, state) => const ResolvedIssuesPage(),
      ),
      GoRoute(
        path: '/issues/details/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '101';
          return IssueDetailsPage(issueId: id);
        },
      ),
      GoRoute(
        path: '/issues/gallery',
        builder: (context, state) => const ImageGalleryPage(),
      ),
      GoRoute(
        path: '/issues/timeline/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '101';
          return IssueTimelinePage(issueId: id);
        },
      ),
      GoRoute(
        path: '/issues/comments/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '101';
          return IssueCommentsPage(issueId: id);
        },
      ),
      GoRoute(
        path: '/issues/location-picker',
        builder: (context, state) => const LocationPickerPage(),
      ),
      GoRoute(
        path: '/issues/image-preview',
        builder: (context, state) => const ImagePreviewPage(),
      ),
      GoRoute(
        path: '/issues/success',
        builder: (context, state) => const ReportSuccessPage(),
      ),
      GoRoute(
        path: '/my-issues/pending',
        builder: (context, state) => const PendingIssuesPage(),
      ),
      GoRoute(
        path: '/my-issues/assigned',
        builder: (context, state) => const AssignedIssuesPage(),
      ),
      GoRoute(
        path: '/my-issues/rejected',
        builder: (context, state) => const RejectedIssuesPage(),
      ),

      // -----------------------------------------------------------------------
      // Citizen Main Stateful Shell (5 Tabs)
      // -----------------------------------------------------------------------
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return CitizenMainShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/issues',
                builder: (context, state) => const ExploreIssuesPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/report-issue',
                builder: (context, state) => const ReportIssuePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/my-issues',
                builder: (context, state) => const MyIssuesPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const CitizenProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
