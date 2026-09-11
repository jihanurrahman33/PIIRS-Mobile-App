# PIIRS Mobile — UI Design Prompts for Stitch

This document contains production-ready, high-fidelity design prompts and design system specifications crafted specifically for **Stitch** (`generate_screen_from_text` and `create_design_system_from_design_md`) to generate screens for the **PIIRS Mobile** (*Public Infrastructure Issue Reporting System*) app.

---

## 1. Global Design System Specification (`DESIGN.md` for Stitch)

```yaml
DesignSystem:
  Name: PIIRS Civic Modern
  Platform: Mobile (iOS & Android)
  Viewport: 390 x 844 px (iPhone / Modern Android)
  Aesthetic: Clean, modern, trustworthy civic tech / public utility UI. High clarity, accessible contrast, soft ambient shadows, rounded corners, clean card dividers.
  
Colors:
  BrandPrimary: "#6366F1"       # Indigo / Electric Purple
  BrandPrimaryDark: "#818CF8"   # Light Indigo Accent
  BrandSecondary: "#0EA5E9"     # Sky / Cyan
  BackgroundLight: "#F8FAFC"    # Cool Off-White Canvas
  SurfaceLight: "#FFFFFF"       # Pure White Card Surface
  BackgroundDark: "#0F172A"     # Deep Slate
  SurfaceDark: "#1E293B"        # Slate Card Surface
  BorderLight: "#E2E8F0"        # Subtle Border
  TextPrimary: "#0F172A"        # Slate 900
  TextSecondary: "#64748B"      # Slate 500
  TextMuted: "#94A3B8"          # Slate 400

StatusColors:
  Pending: "#F59E0B"            # Amber Gold
  InProgress: "#3B82F6"         # Vibrant Blue
  Resolved: "#10B981"           # Emerald Green
  Rejected: "#EF4444"           # Coral Red
  Boosted: "#8B5CF6"            # Royal Violet

PriorityColors:
  Low: "#10B981"                # Emerald
  Normal: "#3B82F6"             # Blue
  High: "#F59E0B"               # Amber
  Urgent: "#EF4444"             # Bright Crimson

Typography:
  FontFamily: "Inter, -apple-system, Roboto, sans-serif"
  Display: "28px, Bold, letterSpacing -0.5px"
  Headline: "22px, SemiBold, letterSpacing -0.3px"
  Title: "18px, SemiBold"
  Body: "14px, Regular, lineHeight 1.5"
  Label: "12px, Medium, letterSpacing 0.2px"
  Caption: "11px, Regular"

ComponentTokens:
  CardRadius: "16px"
  ButtonRadius: "12px"
  InputRadius: "12px"
  BadgeRadius: "999px"          # Pill shape
  CardShadow: "0 4px 12px rgba(15, 23, 42, 0.05), 0 1px 2px rgba(15, 23, 42, 0.08)"
  PrimaryButtonHeight: "52px"
  TouchTargetMin: "48px"
```

---

## 2. Screen Generation Prompts for Stitch

Each prompt below is engineered for direct copy-paste into Stitch's `generate_screen_from_text` tool or the Stitch web studio.

---

### Screen 01: Splash & Brand Launch Screen
- **Screen ID**: `auth_splash`
- **Route**: `/splash`

#### Copy-Paste Prompt for Stitch:
```text
A sleek, modern mobile splash screen for 'ZapShift' (PIIRS - Public Infrastructure Issue Reporting System). The background is a sophisticated deep slate (#0F172A) with a subtle glowing radial indigo gradient (#6366F1) centered in the upper third. In the center, display a high-tech illuminated civic shield icon with an integrated lightning bolt in electric indigo and cyan. Below the logo, bold white typography reads 'ZapShift', followed by a subtitle in muted slate-400 'Public Infrastructure Issue Reporting'. At the bottom, a delicate circular indeterminate spinner in neon indigo (#818CF8) and small white copyright text 'Empowering Citizens, Fixing Cities • v1.0'. Clean, premium civic tech aesthetic, minimal, high-resolution mobile UI.
```

---

### Screen 02: Onboarding Carousel Screen
- **Screen ID**: `auth_onboarding`
- **Route**: `/onboarding`

#### Copy-Paste Prompt for Stitch:
```text
A modern mobile onboarding walkthrough screen for civic reporting app ZapShift. Clean off-white background (#F8FAFC). At the top right, a subtle text button 'Skip' in slate-500. The upper half features a vibrant 3D vector illustration of an active city street with a highlighted pothole and a floating glowing location pin being scanned by a smartphone. Below the illustration, a centered bold headline in slate-900: 'Spot It, Snap It, Report It'. A 2-line description in slate-500: 'Report broken streetlights, potholes, and drainage issues in your neighborhood in seconds.' In the lower third, a 3-dot pagination indicator with the first dot expanded into an active indigo pill (#6366F1). At the bottom, a prominent full-width primary button 'Get Started' (#6366F1, rounded 12px, white text) and a subtle text link 'Already have an account? Sign In'. High-contrast, friendly, accessible mobile UI.
```

---

### Screen 03: Citizen Login Screen
- **Screen ID**: `auth_login`
- **Route**: `/login`

#### Copy-Paste Prompt for Stitch:
```text
A clean, trustworthy mobile login screen for ZapShift. Off-white background (#F8FAFC). Top bar features a minimalist back arrow and a small brand badge. Top section has a friendly greeting: 'Welcome Back' in 24px bold slate-900, with subtitle 'Sign in to track your reported civic issues'. A stacked form with rounded 12px input fields with light borders (#E2E8F0) and subtle icons: Email input with a mail icon placeholder 'name@example.com', and Password input with lock icon and an eye toggle icon for show/hide password. Below the password, a right-aligned 'Forgot Password?' link in indigo (#6366F1). A full-width primary action button 'Sign In' in vibrant indigo (#6366F1, 52px height, bold white text). An 'OR' divider with thin horizontal lines. Social authentication section with two outline buttons side-by-side: 'Continue with Google' (with Google icon) and 'Continue with Apple' (with Apple icon). Bottom footer text: 'Don't have an account? Sign Up' in indigo.
```

---

### Screen 04: Citizen Registration Screen
- **Screen ID**: `auth_register`
- **Route**: `/register`

#### Copy-Paste Prompt for Stitch:
```text
A modern mobile sign up registration screen for civic app ZapShift. Background #F8FAFC. Top bar with a clean back button and page title 'Create Account'. Header contains headline 'Join Your Community' and subtitle 'Help make your city cleaner, safer, and better'. Form fields in rounded 12px white cards with 1px border (#E2E8F0): Full Name input (user icon), Email address (mail icon), Phone number (phone icon with +1 country badge), and Password field with interactive 4-bar password strength meter (red/yellow/green indicator labeled 'Strong'). An interactive checkbox for 'I agree to the Terms of Service and Privacy Policy'. A large full-width 'Create Account' button in solid indigo (#6366F1). Bottom row: 'Already registered? Log In' with clickable link. Clean spacing, crisp typography, accessible touch targets.
```

---

### Screen 05: Citizen Home Dashboard (Civic Hub)
- **Screen ID**: `home_dashboard`
- **Route**: `/home`

#### Copy-Paste Prompt for Stitch:
```text
A high-energy, modern citizen home screen for civic reporting app ZapShift. Top app bar features user avatar with notification bell icon (with red badge) and citizen location pill 'Downtown Ward 4 ▾'. Below, a warm greeting: 'Good morning, Alex 👋' with subtext '2 issues resolved in your area this week'. A large gradient banner card (indigo #6366F1 to royal blue #4F46E5) with white text: 'See a Public Issue?' with a bright white pill button '+ Report Now' and an illustration of a citizen snapping a photo. Below, a 2x2 grid of quick stats: 'Active Reports: 3' (amber badge #F59E0B), 'Resolved: 14' (emerald badge #10B981), 'Upvotes: 89' (blue badge #3B82F6), 'Impact Rank: Top 5%'. Next section: horizontal scrollable category chips with icons: 'All', 'Potholes 🕳️', 'Streetlights 💡', 'Water Leak 💧', 'Trash/Waste 🗑️'. Below, a 'Recent Community Issues' feed showing 2 modern cards with photo thumbnail, issue title 'Deep pothole on Elm Street', status badge 'IN PROGRESS' (#3B82F6), time '2h ago', and upvote counter button '▲ 24'. Bottom navigation bar with 5 icons: Home (active indigo), Explore, Report (+ floating button), My Issues, Profile.
```

---

### Screen 06: Explore & Public Issues Feed Screen
- **Screen ID**: `issues_explore`
- **Route**: `/issues`

#### Copy-Paste Prompt for Stitch:
```text
A comprehensive mobile feed screen for exploring public municipal issues in ZapShift. Top persistent search bar with magnifying glass placeholder 'Search issues by street, keyword, or ID' and a filter slider icon on the right. Below search, a segment toggle: 'List View' (active) and 'Map View' (with mini map pin icon). Filter chips row: 'All Status', 'Pending', 'In Progress', 'Resolved', and 'Urgent'. Feed displays a vertical list of rich issue cards (white card, 16px radius, soft shadow): Each card has an issue image (16:9 aspect ratio with rounded top corners), priority tag top-left ('HIGH' in amber #F59E0B), status badge top-right ('IN PROGRESS' in blue #3B82F6). Below image: Title 'Broken storm drain causing sidewalk flooding', address 'Corner of 5th Ave & Pine St', reporter 'Reported by Citizen • 4h ago', and bottom action row: an upvote chip '▲ Upvote (42)' highlighted in indigo, comment button '💬 8 comments', and share icon. Bottom navigation bar visible.
```

---

### Screen 07: Report New Issue Screen (Core Civic Form)
- **Screen ID**: `issues_report`
- **Route**: `/report-issue`

#### Copy-Paste Prompt for Stitch:
```text
A streamlined mobile form screen for citizens reporting a public issue in ZapShift. Off-white background (#F8FAFC). Top bar with close '✕' button, title 'Report an Issue', and draft auto-save indicator. First section is a media upload zone: A large dashed border box with camera icon '+ Add Photos or Video (Max 4)', showing 2 uploaded thumbnail photos of cracked pavement with a red '✕' remove badge on each thumbnail. Next input: 'Issue Title' field with placeholder 'e.g. Broken streetlight on Oak Lane'. 'Category' selector dropdown showing 'Street Lighting 💡'. 'Priority Level' segmented selector with 4 options: Low, Normal, High, Urgent (#EF4444). 'Location' card showing an interactive mini-map preview with a red pin, address text '742 Evergreen Terrace, Springfield', and an outline button 'Adjust on Map'. 'Description' multi-line text area with character counter '0/500'. Toggle switch row for 'Report Anonymously' with helper text 'Hides your name from public feed'. Bottom fixed bar with large indigo button 'Submit Civic Report' (#6366F1, 52px height).
```

---

### Screen 08: Interactive Location Picker Screen
- **Screen ID**: `issues_location_picker`
- **Route**: `/issues/location-picker`

#### Copy-Paste Prompt for Stitch:
```text
A full-screen interactive GPS map location picker for ZapShift mobile app. The background is a clean vector street map with building footprints and green parks. Center of screen features an animated floating location pin with an indigo ripple pulse (#6366F1). At the top, a floating white search bar with back arrow and placeholder 'Search landmark or address...' with a clear button. Floating right-side GPS floating action button '🎯 Re-center to my location'. At the bottom, a sliding sheet card (white, rounded top corners 24px, subtle handle bar) showing: Address title '452 Market Street', subtext 'Financial District, Ward 2', GPS coordinates pill '37.7891° N, 122.4014° W', and a full-width solid indigo button 'Confirm This Location' (#6366F1, white text, 50px height). High precision, clean map styling.
```

---

### Screen 09: Issue Details & Timeline Screen
- **Screen ID**: `issues_details`
- **Route**: `/issues/details/:id`

#### Copy-Paste Prompt for Stitch:
```text
A detailed mobile issue inspection screen for ZapShift. Top bar with transparent gradient back button, bookmark icon, and share button. Header has a swipeable photo carousel showing high-res evidence photo with pagination pill '1/3' and category pill 'Road Hazard'. Content body (white card, rounded top 24px) has issue title: 'Major Pothole Damaging Vehicles' in 20px bold. Below title: Status badge 'IN PROGRESS' (#3B82F6) and priority tag 'URGENT' (#EF4444). Upvote bar: large pill button '▲ Upvoted (128)' in soft indigo tint and count of community supporters. Reporter info row: avatar 'Jane Doe (Citizen)', 'Reported on Oct 14, 2026', and assigned municipal officer 'Assigned to: Public Works Dept (Officer R. Miller)'. Vertical status progression timeline with checkmarks: 1. 'Reported' (green check), 2. 'Verified by Staff' (green check), 3. 'Crew Dispatched' (active animated blue circle), 4. 'Resolved' (pending grey circle). Below timeline, location map snippet with address 'Main St & 4th Ave'. Bottom sticky bar with 'Add Comment' input and 'Boost Issue' button.
```

---

### Screen 10: Report Submission Success Screen
- **Screen ID**: `issues_success`
- **Route**: `/issues/success`

#### Copy-Paste Prompt for Stitch:
```text
A rewarding, celebration mobile confirmation screen after reporting an issue in ZapShift. Clean white background. Center features an animated emerald green checkmark icon inside an illuminated circle with soft celebratory confetti particles in indigo and amber. Below, bold headline: 'Report Submitted Successfully!' in slate-900. Subtext: 'Thank you for helping improve our city. The Department of Public Works has been notified.' An info card with slate-100 background and dashed border: Tracking Ticket ID '#ZS-84920', Category 'Water Leakage', Estimated Review 'Within 24 Hours'. Two prominent buttons: Primary button 'Track Issue Status' (indigo #6366F1, white text), and secondary outlined button 'Return to Home' (border slate-300, text slate-700). Bottom share prompt: 'Share with neighbors to get upvotes and speed up resolution 🔗'.
```

---

### Screen 11: My Reported Issues (Status Hub)
- **Screen ID**: `issues_my_list`
- **Route**: `/my-issues`

#### Copy-Paste Prompt for Stitch:
```text
A mobile dashboard screen showing all issues reported by the authenticated citizen in ZapShift. Top bar title 'My Reports' with total counter '8 Total Issues'. Below the title, a sticky segmented tab bar with badges: 'All (8)', 'Pending (2)' [amber badge], 'In Progress (3)' [blue badge], 'Resolved (2)' [green badge], and 'Rejected (1)' [red badge]. List of cards: Card 1 shows 'Water Main Leak' with blue 'IN PROGRESS' pill, assigned to 'Water Works', reported 'Yesterday', with progress bar 'Step 2 of 4'. Card 2 shows 'Flickering Street Lamp' with green 'RESOLVED' badge, 'Resolved on Oct 10', and a small 'Resolution Photo' thumbnail with 'View Solution' button. Card 3 shows 'Illegal Dumping' with red 'REJECTED' badge and expandable reason: 'Private property - redirected to HOA'. Floating action button at bottom right: circular indigo button with '+' icon to report new issue. 5-tab bottom navigation bar active on 'My Issues'.
```

---

### Screen 12: Citizen Impact Dashboard & Statistics
- **Screen ID**: `citizen_dashboard`
- **Route**: `/citizen-dashboard`

#### Copy-Paste Prompt for Stitch:
```text
An inspiring mobile analytics and impact dashboard for active citizens in ZapShift. Top app bar title 'My Civic Impact' with a share badge. Hero section features an illuminated circular radial progress ring showing 'Impact Score: 840' with tier label 'Gold Civic Champion 🏆'. Below, a 3-column metric row: '15 Issues Reported', '12 Resolved (80%)', '340 Upvotes Earned'. Middle card: 'Resolution Activity' line/bar chart showing issues resolved over the past 6 months (May to Oct) with indigo and emerald bars. Civic badges showcase section: horizontal scroll of earned badges: 'First Responder 🌟', 'Neighborhood Hero 🛡️', 'Pothole Hunter 🚜', and 'Civic Legend 👑'. Recent activity timeline listing latest milestone: 'Your report on Pine Street was marked Resolved (+50 pts)'. Clean, gamified, motivating civic aesthetic with soft card elevations.
```

---

### Screen 13: Staff Task Management & Work Queue
- **Screen ID**: `staff_dashboard`
- **Route**: `/staff/tasks`

#### Copy-Paste Prompt for Stitch:
```text
A professional, high-efficiency mobile work order screen for municipal staff workers in ZapShift. Darker utilitarian accent top bar with 'Staff Portal: Field Operations' and worker badge 'Officer David K. • Public Works'. Quick status banner: 'Today's Assigned Tasks: 5' with a toggle between 'List View' and 'Route Map'. Filter pills: 'Urgent First', 'Closest Distance (< 2km)', 'In Progress'. Task list shows tactical cards: Card 1 has urgency badge 'URGENT - CRITICAL' in red (#EF4444), Title 'Broken Guardrail after collision', distance '0.8 km away • Maple Highway', reported '45m ago', with action buttons: 'Navigate (GPS) 📍' and 'Start Working 🛠️'. Card 2: 'Downed Tree Branch' (HIGH priority in amber), status 'En Route'. Bottom bar shows quick status toggle: 'Duty Status: On-Duty (Active) 🟢'. Clean, high-readability outdoor daylight-optimized UI.
```

---

### Screen 14: Staff Issue Inspection & Resolution Upload
- **Screen ID**: `staff_resolve_task`
- **Route**: `/staff/resolve/:id`

#### Copy-Paste Prompt for Stitch:
```text
A mobile field resolution form screen for municipal staff completing a repair in ZapShift. Top bar with back arrow and title 'Resolve Task #ZS-7741'. Header displays original issue summary: 'Deep pothole on 8th Ave' with original citizen photo thumbnail. Core resolution section: 'Before & After Evidence'. Two photo boxes side-by-side: 'Original Photo' (locked citizen image) and 'Resolution Photo' with a prominent camera button '+ Capture Work Done Photo' showing a newly asphalted road. Input fields: 'Resolution Action Taken' dropdown ('Repaired & Resurfaced', 'Cleared Obstruction', 'Replaced Bulb'), 'Materials Used / Department Notes' multi-line text area, and 'Time Spent' picker ('1 hr 30 min'). A prominent status change button: 'Mark as Officially Resolved' in solid emerald green (#10B981, white text, 52px height) with a lock confirmation prompt. High-trust field utility design.
```

---

### Screen 15: Admin Municipal Oversight Dashboard
- **Screen ID**: `admin_dashboard`
- **Route**: `/admin/dashboard`

#### Copy-Paste Prompt for Stitch:
```text
A high-level executive mobile analytics dashboard for municipal administrators in ZapShift. Deep slate top header (#0F172A) with white text 'City Operations Command' and date selector 'Last 30 Days ▾'. Top 4 metric tiles with trend percentages: 'Total Reports: 1,429 (+12%)', 'Resolution Rate: 88.4% (+4%)', 'Avg Response: 18.2 hrs (-3 hrs)', 'Active Staff: 42 On-Duty'. Interactive city issue heatmap thumbnail showing density of reports across wards. Section 'Staff Assignment Queue' showing 3 unassigned urgent issues with a quick 'Assign Staff' dropdown button. Section 'Revenue & Civic Boosts' displaying '$12,450 Civic Funds Collected via Stripe'. Bottom tabs: 'Overview', 'All Issues', 'Staff Roster', 'User Moderation'. Polished enterprise civic command center mobile UI.
```

---

### Screen 16: ZapShift Civic Premium & Boost Screen
- **Screen ID**: `premium_checkout`
- **Route**: `/premium`

#### Copy-Paste Prompt for Stitch:
```text
A sleek, premium mobile upgrade and monetization screen for ZapShift Civic Plus. Premium dark theme card with royal violet (#8B5CF6) to indigo (#6366F1) gradient header. Title 'ZapShift Civic Pro ⚡' with subtitle 'Fast-track your reports & support local civic improvement'. Benefits list with checkmark icons: 'Priority inspection queue by municipal staff', 'Instant SMS notifications on status changes', 'Exclusive Verified Citizen Gold Profile Badge', 'Unlimited photo uploads and detailed PDF reports'. Pricing card: '$4.99 / month' or '$39.99 / year (Save 33%)' with 'Best Value' ribbon. Payment method selector showing Stripe integration (Credit Card with Visa/Mastercard logos, Apple Pay, and Google Pay). A large gradient button 'Subscribe with Stripe' (#6366F1, 52px height). Subtext: 'Secure 256-bit encryption by Stripe. Cancel anytime.' Modern, trustworthy fintech-style layout.
```

---

### Screen 17: Citizen Profile & Settings Screen
- **Screen ID**: `citizen_profile`
- **Route**: `/profile`

#### Copy-Paste Prompt for Stitch:
```text
A polished mobile citizen profile and account settings screen for ZapShift. Off-white background (#F8FAFC). Profile header card (white, rounded 20px, subtle shadow): Large circular avatar with edit pencil badge, citizen name 'Alex Morgan', verified citizen checkmark, email 'alex.morgan@example.com', and civic badge 'Level 4 Neighborhood Guardian 🛡️'. Quick stats bar: '24 Reports | 19 Resolved | 98% Accuracy'. Settings menu list grouped into cards: Group 1 'Preferences': 'Push Notifications' (toggle ON), 'Location Services' (toggle ON), 'Dark Mode' (system toggle), 'App Language (English ▾)'. Group 2 'Account & Security': 'Edit Profile Details ➔', 'Change Password ➔', 'Civic Pro Membership (Active) ⚡ ➔'. Group 3 'Support & Legal': 'Help & FAQ', 'Privacy Policy', 'Report a Bug'. Bottom button: Red outline button 'Log Out' (#EF4444) with exit icon, and app version text 'ZapShift v1.0.0 (Build 120)'. 5-tab bottom navigation bar active on 'Profile'.
```

---

### Screen 18: Issue Comments & Community Discussion
- **Screen ID**: `issues_comments`
- **Route**: `/issues/comments/:id`

#### Copy-Paste Prompt for Stitch:
```text
A clean, community-driven mobile discussion screen for a public issue in ZapShift. Top bar with back arrow, title 'Discussion (14)', and issue ticket reference '#ZS-4821'. Header has a compact summary card of the issue: 'Dangerous open manhole on Main St' with status badge 'IN PROGRESS' (#3B82F6). Below, a scrollable timeline of community comments: Comment 1 from 'Public Works Dispatcher [Official Staff Badge]': 'A crew has been dispatched with a temporary safety barricade. ETA 30 minutes.' (highlighted card with subtle blue background). Comment 2 from citizen 'Marcus T.': 'Saw this morning, very dangerous for cyclists! Upvoted.' Comment 3 with photo attachment showing the safety cone placed. Bottom sticky comment composer: User avatar thumbnail, rounded text input field with placeholder 'Add a comment or update...', camera icon button to attach photo, and indigo circular send arrow button. High readability, respectful civic discourse UI.
```

---

## 3. How to Use These Prompts with Stitch

### Method A: Using Stitch MCP in Antigravity / CLI
You can invoke the Stitch MCP tool directly:
```json
{
  "toolName": "generate_screen_from_text",
  "ServerName": "stitch",
  "Arguments": {
    "projectId": "<YOUR_STITCH_PROJECT_ID>",
    "prompt": "<PASTE_SCREEN_PROMPT_HERE>",
    "deviceType": "MOBILE",
    "modelId": "GEMINI_3_8_FLASH"
  }
}
```

### Method B: Uploading the Design System First
To guarantee 100% color and typography consistency across all generated screens:
1. Base64-encode the `DESIGN.md` block from Section 1:
   ```bash
   cat docs/ui_design_prompt.md | base64
   ```
2. Call `upload_design_md` with your Stitch `projectId`.
3. Call `create_design_system_from_design_md` to lock the palette and component tokens.
4. Pass the generated `designSystem` ID into all future `generate_screen_from_text` calls.

---

## 4. Design-to-Code Mapping in PIIRS Codebase

| Stitch Screen Prompt | Corresponding Flutter Page | Clean Architecture BLoC |
| :--- | :--- | :--- |
| **01. Splash** | [`SplashPage`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/auth/presentation/pages/splash_page.dart) | [`AuthBloc`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/auth/presentation/bloc/auth_bloc.dart) |
| **02. Onboarding** | [`OnboardingPage`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/auth/presentation/pages/onboarding_page.dart) | [`AuthBloc`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/auth/presentation/bloc/auth_bloc.dart) |
| **03. Login** | [`LoginPage`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/auth/presentation/pages/login_page.dart) | [`AuthBloc`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/auth/presentation/bloc/auth_bloc.dart) |
| **04. Register** | [`RegisterPage`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/auth/presentation/pages/register_page.dart) | [`AuthBloc`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/auth/presentation/bloc/auth_bloc.dart) |
| **05. Home Dashboard** | [`HomePage`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/home/presentation/pages/home_page.dart) | [`DashboardBloc`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/dashboard/presentation/bloc/dashboard_bloc.dart) |
| **06. Explore Issues** | [`ExploreIssuesPage`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/issues/presentation/pages/explore_issues_page.dart) | [`IssueBloc`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/issues/presentation/bloc/issue_bloc.dart) |
| **07. Report Issue** | [`ReportIssuePage`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/issues/presentation/pages/report_issue_page.dart) | [`IssueBloc`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/issues/presentation/bloc/issue_bloc.dart) |
| **08. Location Picker** | [`LocationPickerPage`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/issues/presentation/pages/location_picker_page.dart) | [`IssueBloc`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/issues/presentation/bloc/issue_bloc.dart) |
| **09. Issue Details** | [`IssueDetailsPage`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/issues/presentation/pages/issue_details_page.dart) | [`IssueBloc`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/issues/presentation/bloc/issue_bloc.dart) |
| **10. Success Screen** | [`ReportSuccessPage`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/issues/presentation/pages/report_success_page.dart) | N/A (Stateless Navigation) |
| **11. My Issues** | [`MyIssuesPage`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/issues/presentation/pages/my_issues_page.dart) | [`IssueBloc`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/issues/presentation/bloc/issue_bloc.dart) |
| **12. Impact Stats** | [`CitizenStatisticsPage`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/dashboard/presentation/pages/citizen_statistics_page.dart) | [`DashboardBloc`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/dashboard/presentation/bloc/dashboard_bloc.dart) |
| **17. Profile** | [`CitizenProfilePage`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/profile/presentation/pages/citizen_profile_page.dart) | [`AuthBloc`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/auth/presentation/bloc/auth_bloc.dart) |
| **18. Comments** | [`IssueCommentsPage`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/issues/presentation/pages/issue_comments_page.dart) | [`IssueBloc`](file:///Users/nishak/Downloads/PIIRS-Mobile-App/lib/features/issues/presentation/bloc/issue_bloc.dart) |
