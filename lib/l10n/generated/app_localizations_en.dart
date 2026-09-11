// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'PIIRS';

  @override
  String get navHome => 'Home';

  @override
  String get navExplore => 'Explore';

  @override
  String get navReport => 'Report';

  @override
  String get navMyIssues => 'My Issues';

  @override
  String get navProfile => 'Profile';

  @override
  String get goodMorning => 'Good morning,';

  @override
  String get goodAfternoon => 'Good afternoon,';

  @override
  String get goodEvening => 'Good evening,';

  @override
  String get welcomeCitizen => 'Citizen';

  @override
  String get searchHint => 'Search reports, road hazards, streetlights...';

  @override
  String get cityReportsOverview => 'City Reports Overview';

  @override
  String get infrastructureCategories => 'Infrastructure Categories';

  @override
  String get recentCommunityReports => 'Recent Community Reports';

  @override
  String get viewAll => 'View All';

  @override
  String get reportAnIssue => 'Report an Issue';

  @override
  String get reportSubtitle =>
      'Help improve our city by reporting civic infrastructure issues';

  @override
  String get totalReports => 'Total Reports';

  @override
  String get inProgress => 'In Progress';

  @override
  String get resolved => 'Resolved';

  @override
  String get critical => 'Critical';

  @override
  String get categoryRoad => 'Roads & Streets';

  @override
  String get categoryWater => 'Water & Sewage';

  @override
  String get categoryLighting => 'Street Lighting';

  @override
  String get categoryWaste => 'Waste & Sanitation';

  @override
  String get categorySafety => 'Public Safety';

  @override
  String get categoryParks => 'Parks & Greenery';

  @override
  String get categoryHazard => 'Hazard';

  @override
  String get statusPending => 'Pending';

  @override
  String get statusInProgress => 'In Progress';

  @override
  String get statusResolved => 'Resolved';

  @override
  String get statusRejected => 'Rejected';

  @override
  String get priorityUrgent => 'URGENT';

  @override
  String get priorityHigh => 'HIGH';

  @override
  String get priorityMedium => 'MEDIUM';

  @override
  String get priorityLow => 'LOW';

  @override
  String get exploreTitle => 'Explore Issues';

  @override
  String get exploreSubtitle =>
      'Track live civic infrastructure reports across the city';

  @override
  String get allStatus => 'All Status';

  @override
  String get myProfile => 'My Profile';

  @override
  String get civicImpact => 'My Civic Impact & Badges';

  @override
  String get civicImpactSubtitle => 'Impact score, tier rankings & badges';

  @override
  String get notificationPreferences => 'Notification Preferences';

  @override
  String get language => 'Language';

  @override
  String get languageSubtitle => 'Choose English or বাংলা';

  @override
  String get english => 'English';

  @override
  String get bangla => 'বাংলা (Bangla)';

  @override
  String get changeLanguage => 'Change Language';

  @override
  String get signOut => 'Sign Out';

  @override
  String get signOutConfirm => 'Are you sure you want to sign out?';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get premiumUpgrade => 'Upgrade to Premium';

  @override
  String get premiumActive => 'Premium Active';

  @override
  String get reportIssueTitle => 'Report Infrastructure Issue';

  @override
  String get titleLabel => 'Issue Title';

  @override
  String get categoryLabel => 'Select Category';

  @override
  String get descriptionLabel => 'Detailed Description';

  @override
  String get locationLabel => 'Location';

  @override
  String get uploadPhoto => 'Upload Photo';

  @override
  String get submitReport => 'Submit Report';

  @override
  String get submitting => 'Submitting...';

  @override
  String get reportSuccess => 'Report Submitted Successfully!';

  @override
  String ticketNumber(String id) {
    return 'Ticket #$id';
  }

  @override
  String upvotesCount(int count) {
    return '$count Upvotes';
  }

  @override
  String commentsCount(int count) {
    return '$count Comments';
  }
}
