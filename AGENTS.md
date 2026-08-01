# AGENTS.md - PIIRS Mobile (ZapShift) Development Guide

This document serves as the master specification, architecture blueprint, and coding standard for all AI agents working on the **ZapShift / PIIRS Mobile** (*Public Infrastructure Issue Reporting System*) codebase.

---

## 1. Project Overview & Identity

- **App Name:** ZapShift / PIIRS Mobile (v1.0)
- **Goal:** Production-ready Flutter mobile application enabling citizens to report public issues, staff to manage assigned tasks, and administrators to oversee users, issues, analytics, and staff assignments.
- **Backend API Base URL:** `https://public-infrastructure-issue-reporti-pearl.vercel.app/`
- **Authentication:** Firebase Authentication with JWT Bearer Token (`Authorization: Bearer <Firebase_ID_Token>`).

---

## 2. Technology Stack & Key Dependencies

| Category | Technology / Package |
| :--- | :--- |
| **Framework & Language** | Flutter (Latest Stable), Dart (Null-Safe) |
| **Architecture** | Feature-First Clean Architecture, SOLID Principles, Repository Pattern |
| **State Management** | `flutter_bloc`, `equatable` |
| **Dependency Injection** | `get_it` |
| **Networking** | `Dio` (Interceptors, Auth Tokens, Base URL, Error Handlers) |
| **Authentication** | Firebase Authentication (`firebase_auth`) |
| **Routing** | `go_router` (Declarative, Protected Routes) |
| **Local Storage** | `flutter_secure_storage`, `shared_preferences` |
| **Payment** | Stripe (`flutter_stripe`) |
| **Push Notifications & Crash Analytics** | Firebase Cloud Messaging, Firebase Crashlytics |
| **Media & Maps** | `image_picker`, `flutter_map` / Google Maps |

---

## 3. Architecture & Layering Rules

The project strictly follows **Feature-First Clean Architecture**.

```text
lib/
├── core/
│   ├── config/
│   ├── constants/
│   ├── dependency_injection/
│   ├── errors/
│   ├── exceptions/
│   ├── extensions/
│   ├── network/
│   ├── routes/
│   ├── services/
│   ├── theme/
│   ├── usecases/
│   ├── utils/
│   └── widgets/
├── features/
│   ├── auth/
│   ├── home/
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
   - **MUST NOT** import Flutter UI libraries, Dio, or Firebase SDKs.
   - Entities must be immutable (`Equatable`).
   - Each business action requires a single-purpose `UseCase` class (e.g., `CreateIssueUseCase`, `GetPublicIssuesUseCase`).

2. **Data Layer (`features/<feature>/data/`)**:
   - Contains **Data Sources** (Remote API / Local Storage), **Models** (JSON serialization/deserialization, mapping to Domain Entities), and **Repository Implementations**.
   - Converts raw network/storage Exceptions into domain `Failure` objects.

3. **Presentation Layer (`features/<feature>/presentation/`)**:
   - Contains **Bloc/Cubit**, **Pages**, and **Widgets**.
   - UI communicates strictly with **UseCases** through BLoC state management.
   - **NEVER** call Dio or Firebase directly from UI components or widgets.
   - **NEVER** import Data Models in Presentation (only Domain Entities).

---

## 4. User Roles & Access Control Matrix

The system enforces three distinct user roles:

1. **Citizen:**
   - Can: Register/Login, Report Issues, View Own Issues, Browse Public Issues, Upvote Issues, Purchase Premium, View Citizen Dashboard, Edit Profile.
   - Cannot: Assign Staff, Update Issue Status, Access Admin Panel.

2. **Staff:**
   - Can: Login, View Assigned Tasks, Update Task/Issue Status, View Staff Dashboard, View Task Details.
   - Cannot: Create Staff, Manage Users, View Admin Dashboard.

3. **Admin:**
   - Has full operational control: User Management (Block/Unblock), Staff Management (Add/Assign), Analytics & Revenue Monitoring, Issue Oversight.

---

## 5. API Endpoints Reference (23 APIs)

### Health Check
- `GET /` - Public health check

### Payments
- `POST /create-checkout-session` - Requires Auth (Stripe Session)
- `PATCH /payment-success?session_id=` - Verify Stripe payment & grant Premium

### Users
- `GET /users` - List users (`limit`, `sort`)
- `GET /users/:email/role` - Retrieve user role details
- `POST /users` - Register new user (Firebase Token required)
- `PATCH /users/:id/isBlocked` - Block/unblock user (Admin)
- `GET /users/:role/staffs` - List staff members (Admin)
- `POST /users/add-staff` - Create staff member (Admin)

### Issues
- `GET /issues` - Public issue list (`limit`, `sort`, `status`, `priority`, `isBoosted`)
- `GET /issues/all` - All issues
- `GET /issues/all/admin` - Admin issue list (Admin)
- `GET /issues/details/:id` - Fetch issue details
- `POST /issues` - Create issue (Authenticated User)
- `PATCH /issues/:issueId/status` - Update issue status (Staff/Admin)
- `GET /my-issues` - Logged-in user's issues
- `GET /issues/user/:email` - User specific issues
- `GET /issues/:staffEmail/assinedTask` - Assigned staff tasks (Staff)
- `POST /issues/:selectedIssueId/assign` - Assign staff to issue (Admin)
- `PATCH /issues/:id/upvote` - Toggle upvote on issue

### Dashboards
- `GET /dashboard/admin/stats` - Admin metrics (Admin)
- `GET /dashboard/staff/:email/stats` - Staff metrics (Staff)
- `GET /dashboard/citizen/:email/stats` - Citizen metrics (Authenticated User)

---

## 6. Coding Standards & Best Practices

- **SOLID & DRY:** Keep functions small (< 20 lines) with a single responsibility.
- **Naming Conventions:**
  - Files & Folders: `snake_case` (e.g., `issue_repository_impl.dart`)
  - Classes & Enums: `PascalCase` (e.g., `CreateIssueUseCase`)
  - Variables & Methods: `camelCase` (e.g., `fetchAssignedTasks`)
- **Formatting:** Enforce 80-character maximum line length. Format using `dart format`.
- **Null Safety:** Write soundly null-safe Dart. Avoid using `!` assertion unless non-null is strictly guaranteed.
- **Logging:** Use `dart:developer` structured logging (`developer.log()`) instead of `print()`.
- **Material 3 & Theming:** Centralized `ThemeData` generated via `ColorScheme.fromSeed`. Support dynamic Light and Dark modes.
- **Error Handling:** UI components must receive structured `Failure` objects, never uncaught exceptions.

---

## 7. Step-by-Step Feature Implementation Order

When implementing any feature, create files in dependency order:

1. **Domain Layer:**
   - Entity $\rightarrow$ Repository Interface $\rightarrow$ Use Cases
2. **Data Layer:**
   - Data Model (with `fromJson`/`toJson`/`toEntity`) $\rightarrow$ Data Sources $\rightarrow$ Repository Implementation
3. **Presentation Layer:**
   - BLoC (Events, States, Bloc) $\rightarrow$ Page / Screen $\rightarrow$ Reusable Widgets
4. **Dependency Injection & Routing:**
   - Register in `get_it` DI container $\rightarrow$ Add routes in `GoRouter` configuration
5. **Testing:**
   - Unit tests for UseCases/Repositories $\rightarrow$ BLoC tests $\rightarrow$ Widget tests

---

## 8. Agent Operations & Tools

- Run `flutter test` for automated testing.
- Run `dart format .` and `flutter analyze` for code style and linting enforcement.
- Use `mocktail` for mocking repository and service contracts in unit tests.
