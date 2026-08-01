# AGENTS.md - PIIRS Mobile (ZapShift) Development Guide

This document serves as the master specification, architecture blueprint, coding standard, and security guide for all AI agents working on the **ZapShift / PIIRS Mobile** (*Public Infrastructure Issue Reporting System*) codebase.

---

## 1. Project Overview & Identity

- **App Name:** ZapShift / PIIRS Mobile (v1.0)
- **Goal:** Production-ready Flutter mobile application enabling citizens to report public issues, staff to manage assigned tasks, and administrators to oversee users, issues, analytics, and staff assignments.
- **Backend API Base URL:** Dynamic configuration via `EnvConfig.baseUrl` (Default: `https://public-infrastructure-issue-reporti-pearl.vercel.app/`).
- **Authentication:** Firebase Authentication with JWT Bearer Token (`Authorization: Bearer <Firebase_ID_Token>`).

---

## 2. Technology Stack & Key Dependencies

| Category | Technology / Package |
| :--- | :--- |
| **Framework & Language** | Flutter (Latest Stable), Dart (Null-Safe) |
| **Architecture** | Feature-First Clean Architecture, SOLID Principles, Repository Pattern |
| **State Management** | `flutter_bloc`, `equatable` |
| **Dependency Injection** | `get_it` (`service_locator.dart`) |
| **Networking** | `http` (`HttpApiClient`), `dio` |
| **Security & Environment** | `EnvConfig` (`--dart-define`), `flutter_secure_storage` (`SecureStorageService`) |
| **Authentication** | Firebase Authentication (`firebase_auth`) |
| **Routing** | `go_router` (`AppRouter`) |
| **Local Storage** | `flutter_secure_storage`, `shared_preferences` |
| **Payment & Media** | Stripe (`flutter_stripe`), `image_picker`, `flutter_map` / Google Maps |
| **Typography & Theme** | Material 3, `google_fonts` (Inter), `AppTheme` |

---

## 3. Architecture & Layering Rules

The project strictly follows **Feature-First Clean Architecture**.

```text
lib/
├── core/
│   ├── config/ (env_config.dart)
│   ├── constants/ (api_constants.dart)
│   ├── dependency_injection/ (service_locator.dart)
│   ├── errors/ (failures.dart)
│   ├── exceptions/ (exceptions.dart)
│   ├── extensions/
│   ├── network/ (api_client.dart, http_api_client.dart, auth_token_provider.dart, secure_storage_auth_token_provider.dart, network_info.dart)
│   ├── routes/ (app_router.dart)
│   ├── services/ (secure_storage_service.dart)
│   ├── theme/ (app_colors.dart, app_theme_extensions.dart, app_theme.dart)
│   ├── usecases/
│   ├── utils/ (validators.dart, responsive.dart)
│   └── widgets/ (app_animations.dart, skeleton_loader.dart, error_view.dart, app_snackbar.dart)
├── features/
│   ├── auth/ (splash_page.dart, login_page.dart, register_page.dart)
│   ├── home/ (home_page.dart)
│   ├── issues/
│   ├── dashboard/
│   ├── premium/
│   ├── profile/
│   ├── staff/
│   └── admin/
├── l10n/
├── firebase_options.dart
└── main.dart
```

### Clean Architecture Dependency Rule
$$\text{Presentation} \longrightarrow \text{Domain} \longleftarrow \text{Data}$$

1. **Domain Layer (`features/<feature>/domain/`)**:
   - Contains pure Dart business logic: **Entities**, **Repository Interfaces**, and **UseCases**.
   - **MUST NOT** import Flutter UI libraries, Dio, http, or Firebase SDKs.
   - Entities must be immutable (`Equatable`).
   - Each business action requires a single-purpose `UseCase` class (e.g., `CreateIssueUseCase`, `GetPublicIssuesUseCase`).

2. **Data Layer (`features/<feature>/data/`)**:
   - Contains **Data Sources** (Remote API / Local Storage), **Models** (JSON serialization/deserialization, mapping to Domain Entities), and **Repository Implementations**.
   - Converts raw network/storage Exceptions into domain `Failure` objects (`ServerFailure`, `NetworkFailure`, `UnauthorizedFailure`, `BadRequestFailure`, `NotFoundFailure`).

3. **Presentation Layer (`features/<feature>/presentation/`)**:
   - Contains **Bloc/Cubit**, **Pages**, and **Widgets**.
   - UI communicates strictly with **UseCases** through BLoC state management.
   - **NEVER** call API or Firebase directly from UI components or widgets.
   - **NEVER** import Data Models in Presentation (only Domain Entities).

---

## 4. Security & Environment Rules

- **No Hardcoded Secrets or URLs:** Use `EnvConfig` backing `String.fromEnvironment` for Base URLs (`ZAPSHIFT_BASE_URL`), Stripe keys (`ZAPSHIFT_STRIPE_KEY`), and environment modes (`ZAPSHIFT_ENV`).
- **Encrypted Local Storage:** Store sensitive tokens (JWT, Refresh Token) in `SecureStorageService` (`flutter_secure_storage` with Android `EncryptedSharedPreferences` and iOS `Keychain`). Never store tokens in unencrypted `SharedPreferences`.
- **Form Validation & Sanitization:** Use `Validators` (`validateEmail`, `validatePassword`, `validateName`, `validatePhone`, `sanitizeInput`) across all form input fields.

---

## 5. UI/UX, Theming & Responsiveness

- **Material 3 Theme:** Centralized `AppTheme` generated via `ColorScheme.fromSeed(seedColor: AppColors.primarySeed)`.
- **Custom Theme Extensions:** Use `Theme.of(context).extension<StatusColors>()` for status badge colors (`pending`, `inProgress`, `resolved`, `rejected`, `boosted`).
- **Responsive Layout:** Use `context.isMobile`, `context.isTablet`, `context.isDesktop`, `context.responsiveValue(...)`, and `ResponsiveLayout` builder widget.
- **Skeleton Loading:** Use `ShimmerLoader`, `SkeletonBox`, `SkeletonCard`, `SkeletonListTile` for async loading states instead of plain spinners.
- **Micro-Animations:** Use `FadeInSlide` for card/page entrance transitions and `PulseAnimation` for active alerts.
- **Error Feedback UI:** Use `ErrorView.fromFailure(failure, {onRetry})` for error screens and `AppSnackBar` (`showError`, `showSuccess`, `showWarning`) for floating toasts.

---

## 6. User Roles & Access Control Matrix

1. **Citizen:** Register/Login, Report Issues, View Own Issues, Browse Public Issues, Upvote Issues, Purchase Premium, View Citizen Dashboard, Edit Profile.
2. **Staff:** Login, View Assigned Tasks, Update Task/Issue Status, View Staff Dashboard, View Task Details.
3. **Admin:** Full Control: User Management (Block/Unblock), Staff Management (Add/Assign), Analytics & Revenue Monitoring, Issue Oversight.

---

## 7. API Endpoints Reference (23 APIs)

### Health Check
- `GET /` (`ApiConstants.health`)

### Payments
- `POST /create-checkout-session` (`ApiConstants.createCheckoutSession`)
- `PATCH /payment-success?session_id=` (`ApiConstants.paymentSuccess`)

### Users
- `GET /users` (`ApiConstants.users`)
- `GET /users/:email/role` (`ApiConstants.userRole(email)`)
- `POST /users` (`ApiConstants.users`)
- `PATCH /users/:id/isBlocked` (`ApiConstants.blockUser(id)`)
- `GET /users/:role/staffs` (`ApiConstants.getStaffs(role)`)
- `POST /users/add-staff` (`ApiConstants.addStaff`)

### Issues
- `GET /issues` (`ApiConstants.issues`)
- `GET /issues/all` (`ApiConstants.allIssues`)
- `GET /issues/all/admin` (`ApiConstants.allAdminIssues`)
- `GET /issues/details/:id` (`ApiConstants.issueDetails(id)`)
- `POST /issues` (`ApiConstants.issues`)
- `PATCH /issues/:issueId/status` (`ApiConstants.updateIssueStatus(issueId)`)
- `GET /my-issues` (`ApiConstants.myIssues`)
- `GET /issues/user/:email` (`ApiConstants.userIssues(email)`)
- `GET /issues/:staffEmail/assinedTask` (`ApiConstants.staffAssignedTasks(staffEmail)`)
- `POST /issues/:selectedIssueId/assign` (`ApiConstants.assignIssue(issueId)`)
- `PATCH /issues/:id/upvote` (`ApiConstants.upvoteIssue(id)`)

### Dashboards
- `GET /dashboard/admin/stats` (`ApiConstants.adminDashboardStats`)
- `GET /dashboard/staff/:email/stats` (`ApiConstants.staffDashboardStats(email)`)
- `GET /dashboard/citizen/:email/stats` (`ApiConstants.citizenDashboardStats(email)`)

---

## 8. Coding Standards & Testing

- **SOLID & DRY:** Keep functions small (< 20 lines) with a single responsibility.
- **Naming Conventions:**
  - Files & Folders: `snake_case` (e.g., `secure_storage_service.dart`)
  - Classes & Enums: `PascalCase` (e.g., `SecureStorageService`)
  - Variables & Methods: `camelCase` (e.g., `getAuthToken`)
- **Formatting:** Enforce 80-character maximum line length.
- **Null Safety:** Write soundly null-safe Dart. Avoid `!` assertion.
- **Logging:** Use `dart:developer` (`developer.log()`) instead of `print()`.
- **Automated Testing:** Run `flutter test` for verification. All new features and core infrastructure must maintain 100% test passing rate.
