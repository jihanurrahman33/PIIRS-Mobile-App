import '../config/env_config.dart';

/// API Constants containing base URL, timeouts, and API paths.
abstract class ApiConstants {
  /// Dynamic Base URL for the PIIRS backend server.
  static String get baseUrl => EnvConfig.baseUrl;

  /// Network connection & response timeout duration (30 seconds).
  static const Duration timeout = Duration(seconds: 30);

  // ---------------------------------------------------------------------------
  // 1. Health Check
  // ---------------------------------------------------------------------------
  static const String health = '/';

  // ---------------------------------------------------------------------------
  // 2. Payments
  // ---------------------------------------------------------------------------
  static const String createCheckoutSession = '/create-checkout-session';
  static const String paymentSuccess = '/payment-success';

  // ---------------------------------------------------------------------------
  // 3. Users
  // ---------------------------------------------------------------------------
  static const String users = '/users';
  static const String addStaff = '/users/add-staff';

  static String userRole(String email) => '/users/$email/role';
  static String blockUser(String id) => '/users/$id/isBlocked';
  static String getStaffs(String role) => '/users/$role/staffs';

  // ---------------------------------------------------------------------------
  // 4. Issues
  // ---------------------------------------------------------------------------
  static const String issues = '/issues';
  static const String allIssues = '/issues/all';
  static const String allAdminIssues = '/issues/all/admin';
  static const String myIssues = '/my-issues';

  static String issueDetails(String id) => '/issues/details/$id';
  static String updateIssueStatus(String issueId) => '/issues/$issueId/status';
  static String userIssues(String email) => '/issues/user/$email';
  static String staffAssignedTasks(String staffEmail) =>
      '/issues/$staffEmail/assinedTask';
  static String assignIssue(String issueId) => '/issues/$issueId/assign';
  static String upvoteIssue(String id) => '/issues/$id/upvote';

  // ---------------------------------------------------------------------------
  // 5. Dashboards
  // ---------------------------------------------------------------------------
  static const String adminDashboardStats = '/dashboard/admin/stats';
  static String staffDashboardStats(String email) =>
      '/dashboard/staff/$email/stats';
  static String citizenDashboardStats(String email) =>
      '/dashboard/citizen/$email/stats';
}
