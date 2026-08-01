# AGENTS.md - PIIRS Mobile (ZapShift) Development Guide

This document serves as the master specification, architecture blueprint, coding standard, and security guide for all AI agents working on the **ZapShift / PIIRS Mobile** (*Public Infrastructure Issue Reporting System*) codebase.

---

## 1. Mandatory Industry-Grade Engineering & Architecture Rules

For **EVERY** feature module built in this project (e.g., Auth, Issues, Dashboard, Premium, Profile, Staff, Admin), the agent MUST automatically enforce:

### A. Mandatory Architecture: Feature-First Clean Architecture
$$\text{Presentation Layer (BLoC / Pages / Widgets)} \longrightarrow \text{Domain Layer (Entities / Repositories / UseCases)} \longleftarrow \text{Data Layer (Models / DataSources / RepositoriesImpl)}$$

1. **Domain Layer (`features/<feature>/domain/`):**
   - **Entities:** Pure Dart classes extending `Equatable`. No Flutter or third-party package imports.
   - **Repository Contracts:** Abstract repository interfaces defining business operations.
   - **Use Cases:** Single-purpose business action classes (`LoginUseCase`, `CreateIssueUseCase`, etc.).

2. **Data Layer (`features/<feature>/data/`):**
   - **Models:** Extend Domain Entities and provide `fromJson` and `toJson` serialization.
   - **Data Sources:** Abstract and concrete Remote (`ApiClient`) & Local (`SecureStorageService`) data sources.
   - **Repository Implementations:** Implement domain repository interfaces and map raw HTTP/storage exceptions to domain `Failure` objects (`ServerFailure`, `UnauthorizedFailure`, `NetworkFailure`).

3. **Presentation Layer (`features/<feature>/presentation/`):**
   - **BLoC / Cubit:** Manages UI states and event transitions (`Events`, `States`, `Bloc`).
   - **Pages:** Modular page screens ($<80$ lines per file).
   - **Widgets:** Feature-specific presentation widgets in `presentation/widgets/`.

---

### B. Mandatory Design Patterns (Minimum 2 Enforced per Feature)

1. **Repository Pattern:**
   - Decouples business logic in UseCases from data retrieval implementations (REST APIs, Local Storage, Firebase).
2. **BLoC (Business Logic Component) Pattern:**
   - Enforces unidirectional data flow: $\text{UI Events} \rightarrow \text{BLoC} \rightarrow \text{UI States}$.
3. **Factory Pattern:**
   - Used in factory constructors (`Model.fromJson`, `ErrorView.fromFailure`) and dependency instantiation.
4. **Singleton Pattern (via Dependency Injection):**
   - Managed singletons registered in `GetIt` ([service_locator.dart](file:///Users/nishak/Downloads/Flutter%20Project/ZapShift/lib/core/dependency_injection/service_locator.dart)) for services, data sources, and repositories.

---

### C. Mandatory SOLID Principles Enforcement

- **Single Responsibility Principle (SRP):**
  - Exactly **1 class or widget per file**.
  - File length $\le 80$ lines.
  - Function length $< 20$ lines per method.
- **Open/Closed Principle (OCP):**
  - Extended behavior through abstractions (`ApiClient`, `AuthTokenProvider`, `NetworkInfo`, `SecureStorageService`).
- **Liskov Substitution Principle (LSP):**
  - Subclasses ([HttpApiClient](file:///Users/nishak/Downloads/Flutter%20Project/ZapShift/lib/core/network/http_api_client.dart), [SecureStorageAuthTokenProvider](file:///Users/nishak/Downloads/Flutter%20Project/ZapShift/lib/core/network/secure_storage_auth_token_provider.dart)) substitute abstract parent contracts transparently.
- **Interface Segregation Principle (ISP):**
  - Small, domain-focused contracts avoiding fat interfaces.
- **Dependency Inversion Principle (DIP):**
  - High-level presentation and domain layers depend strictly on abstractions, never on concrete HTTP or Firebase SDK implementations.

---

## 2. Mandatory Automated Feature Build Checklist

When building any feature, automatically execute the following steps without requiring user prompts:

1. **Scaffold Clean Architecture Folders:** `domain/entities`, `domain/repositories`, `domain/usecases`, `data/models`, `data/datasources`, `data/repositories`, `presentation/bloc`, `presentation/pages`, `presentation/widgets`.
2. **Implement Single-Class Files:** Enforce 1 class/widget per file ($<80$ lines per file).
3. **Reuse Core Components:** Consume shared widgets from `lib/core/widgets/` (`AppButton`, `AppOutlinedButton`, `AppTextField`, `AppPasswordField`, `AppCard`, `AppHeader`, `StatusBadge`, `ErrorView`, `ShimmerLoader`).
4. **Register DI & Routes:** Add DataSources, Repositories, UseCases, and BLoC to `GetIt` ([service_locator.dart](file:///Users/nishak/Downloads/Flutter%20Project/ZapShift/lib/core/dependency_injection/service_locator.dart)) and routes to [app_router.dart](file:///Users/nishak/Downloads/Flutter%20Project/ZapShift/lib/core/routes/app_router.dart).
5. **Automated Quality Gate:** Run `dart format .`, `flutter analyze` (**0 issues allowed**), and `flutter test` (**100% pass rate required**).

---

## 3. Technology Stack & Key Dependencies

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

## 4. Security & Environment Rules

- **No Hardcoded Secrets or URLs:** Use `EnvConfig` backing `String.fromEnvironment` for Base URLs (`ZAPSHIFT_BASE_URL`), Stripe keys (`ZAPSHIFT_STRIPE_KEY`), and environment modes (`ZAPSHIFT_ENV`).
- **Encrypted Local Storage:** Store sensitive tokens (JWT, Refresh Token) in `SecureStorageService` (`flutter_secure_storage` with Android `EncryptedSharedPreferences` and iOS `Keychain`).
- **Form Validation & Sanitization:** Use `Validators` (`validateEmail`, `validatePassword`, `validateName`, `validatePhone`, `sanitizeInput`) across all form input fields.

---

## 5. UI/UX, Theming & Responsiveness

- **Material 3 Theme:** Centralized `AppTheme` generated via `ColorScheme.fromSeed(seedColor: AppColors.primarySeed)`.
- **Custom Theme Extensions:** Use `Theme.of(context).extension<StatusColors>()` for status badge colors (`pending`, `inProgress`, `resolved`, `rejected`, `boosted`).
- **Responsive Layout:** Use `context.isMobile`, `context.isTablet`, `context.isDesktop`, `context.responsiveValue(...)`, and `ResponsiveLayout` builder widget.
- **Skeleton Loading:** Use `ShimmerLoader`, `SkeletonBox`, `SkeletonCard`, `SkeletonListTile` for async loading states.
- **Micro-Animations:** Use `FadeInSlide` for entrance transitions and `PulseAnimation` for active alerts.
- **Error Feedback UI:** Use `ErrorView.fromFailure(failure, {onRetry})` for error screens and `AppSnackBar` (`showError`, `showSuccess`, `showWarning`) for toasts.

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

## 8. Coding Standards & Automated Verification

- **SOLID & DRY:** Keep functions small (< 20 lines) with a single responsibility.
- **Naming Conventions:**
  - Files & Folders: `snake_case` (e.g., `secure_storage_service.dart`)
  - Classes & Enums: `PascalCase` (e.g., `SecureStorageService`)
  - Variables & Methods: `camelCase` (e.g., `getAuthToken`)
- **Formatting:** Enforce 80-character maximum line length.
- **Null Safety:** Write soundly null-safe Dart. Avoid `!` assertion.
- **Logging:** Use `dart:developer` (`developer.log()`) instead of `print()`.
- **Automated Testing:** All features require unit & widget tests, maintaining 100% test pass rate.
