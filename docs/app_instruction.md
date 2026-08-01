# PIIRS Mobile Application Software Requirements & Architecture Document

## Version

**v1.0**

---

# 1. Project Overview

## Project Name

**PIIRS Mobile**

*(Public Issue Identification & Reporting System)*

---

## Project Goal

Develop a **production-ready Flutter mobile application** that enables citizens to report public issues, allows government staff to manage assigned tasks, and provides administrators with complete control over users, issues, analytics, and staff management.

The application will consume the existing Node.js + Express backend APIs and use Firebase Authentication for secure authentication.

The application should follow **Feature-First Clean Architecture**, making it scalable, maintainable, testable, and suitable for long-term development.

---

# 2. Technology Stack

### Frontend

* Flutter (Latest Stable)
* Dart

### Architecture

* Feature First
* Clean Architecture
* SOLID Principles
* Repository Pattern

### State Management

* flutter_bloc

### Dependency Injection

* get_it
* injectable (optional)

### Networking

* http/Dio

### Authentication

* Firebase Authentication

### Local Storage

* flutter_secure_storage
* shared_preferences
* Hive (optional)

### Maps

* flutter_map / Google Maps

### Payment

* Stripe

### Routing

* GoRouter

### Image Upload

* image_picker

### Push Notifications

* Firebase Cloud Messaging

### Crash Reporting

* Firebase Crashlytics

---

# 3. User Roles

The system supports three roles.

---

## Citizen

Can

* Register/Login
* Report Issues
* View Own Issues
* Browse Public Issues
* Upvote Issues
* Purchase Premium
* View Dashboard
* Edit Profile

Cannot

* Assign Staff
* Resolve Issues
* View Admin Panel

---

## Staff

Can

* Login
* View Assigned Tasks
* Update Issue Status
* View Staff Dashboard
* View Assigned Issue Details

Cannot

* Create Staff
* Manage Users
* View Admin Dashboard

---

## Admin

Has full access.

Can

* Manage Users
* Block Users
* Add Staff
* Assign Staff
* View Analytics
* Manage Issues
* View All Users
* View All Issues
* View Revenue

---

# 4. Existing Backend APIs

## Authentication

Firebase Authentication

Bearer Token

---

## Payment

* Create Checkout Session
* Payment Success

---

## User APIs

* Get Users
* Register User
* Get User Role
* Block User
* Add Staff
* Get Staff Members

---

## Issue APIs

* Get Issues
* Issue Details
* Create Issue
* Upvote
* Assign Staff
* Update Status
* My Issues
* User Issues

---

## Dashboard APIs

### Citizen Dashboard

* Submitted Issues
* Pending Issues
* Open Issues
* Upvotes
* Activity

### Staff Dashboard

* Assigned Tasks
* Resolved Issues
* Average Response Time

### Admin Dashboard

* Total Issues
* Revenue
* Payments
* Last 7 Days Analytics

---

# 5. App Modules

---

## Authentication

### Screens

Splash

Login

Register

Forgot Password

Email Verification

Profile Setup

---

## Home

Displays

Latest Issues

Trending Issues

Resolved Issues

Nearby Issues (Future)

Categories

Search

Premium Banner

---

## Issue Module

### Create Issue

Fields

Title

Description

Category

Priority

Location

Images

Anonymous Toggle

Submit

---

### Issue Details

Displays

Images

Description

Status

Created Date

Reporter

Assigned Staff

Timeline

Upvotes

Comments (Future)

---

### My Issues

Shows

Pending

Assigned

Resolved

Rejected

---

## Premium Module

Stripe Checkout

Premium Status

Payment History

Benefits

---

## Dashboard

Citizen Dashboard

Staff Dashboard

Admin Dashboard

Different UI based on role.

---

## Staff Module

Assigned Tasks

Today's Tasks

Task Details

Update Status

---

## Admin Module

User Management

Issue Management

Staff Management

Analytics

Revenue

---

## Profile

Edit Profile

Change Password

Logout

Premium Status

---

# 6. Feature-wise Folder Structure

```text
lib/

core/

features/

    auth/

    home/

    issues/

    dashboard/

    premium/

    profile/

    admin/

    staff/

main.dart
```

---

# 7. Clean Architecture

Every feature follows

```
feature/

data/

domain/

presentation/
```

---

## Data

datasource/

models/

repositories/

---

## Domain

entities/

repositories/

usecases/

---

## Presentation

bloc/

pages/

widgets/

---

# 8. Core Folder

Contains

Network

API Client

Interceptors

Errors

Theme

Utils

Widgets

Constants

Extensions

Dependency Injection

Routes

UseCase Base Class

---

# 9. Networking

Use Dio

Global configuration

Automatic token injection

401 interceptor

Refresh token support

Timeout

Logging

Error parser

---

# 10. State Management

flutter_bloc

Every feature should contain

Bloc

Events

States

Repository

UseCases

---

# 11. Dependency Injection

Use get_it

Register

Repositories

UseCases

DataSources

Services

Dio

Firebase

Bloc

---

# 12. Local Storage

Store

JWT Token

Theme

Language

User Info

Premium Status

Remember Login

---

# 13. Security

Firebase Authentication

Secure Token Storage

API Authorization

Role Validation

Input Validation

No Sensitive Data Stored in SharedPreferences

---

# 14. Theme

Material 3

Dark Mode

Light Mode

Responsive

Reusable Components

---

# 15. Error Handling

Failure Classes

Custom Exceptions

Snackbar

Retry Dialog

Offline Screen

---

# 16. Future Features

Chat

Issue Timeline

Comments

Image Compression

Offline Sync

Push Notifications

Real-time Issue Updates

Location Tracking

AI Issue Detection

OCR

QR Verification

Multi-language

---

# 17. Testing

Unit Tests

Bloc Tests

Widget Tests

Repository Tests

---

# 18. Development Rules

* Follow Clean Architecture strictly.
* Use feature-first organization.
* Keep business logic in the Domain layer.
* Do not access APIs directly from the UI.
* Use immutable state and `Equatable`.
* Use reusable widgets and consistent naming.
* Write documentation comments for public APIs.
* Add tests for repositories, use cases, and blocs.
* Prefer composition over duplication and keep classes focused on a single responsibility.

---

# 19. Development Roadmap

### Phase 1 – Foundation

* Project setup
* Clean Architecture structure
* Dependency Injection
* Theme
* Routing
* Firebase Authentication
* Networking

### Phase 2 – Core Features

* Authentication
* Profile
* Home
* Issue Reporting
* Issue Listing
* Issue Details

### Phase 3 – Role-Based Features

* Citizen Dashboard
* Staff Dashboard
* Admin Dashboard
* Staff Assignment
* Status Updates
* User Management

### Phase 4 – Premium & Payments

* Stripe Checkout
* Premium Status
* Payment History

### Phase 5 – Quality & Release

* Offline support
* Push notifications
* Unit and widget tests
* Performance optimization
* Play Store & App Store deployment

---

## Suggested Initial MVP

For the first release, prioritize the following features:

1. Splash & Authentication
2. Home with public issues
3. Create Issue
4. Issue Details
5. My Issues
6. User Profile
7. Citizen Dashboard
8. Staff Dashboard
9. Admin Dashboard
10. Stripe Premium
11. Settings (theme, logout)
12. Firebase Push Notifications

This scope aligns well with your existing backend APIs, allowing you to build the mobile app without requiring major backend changes while leaving room for future enhancements such as comments, issue timelines, and offline synchronization.
