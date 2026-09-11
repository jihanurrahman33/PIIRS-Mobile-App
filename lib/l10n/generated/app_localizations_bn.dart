// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'পিআইআইআরএস';

  @override
  String get navHome => 'হোম';

  @override
  String get navExplore => 'অন্বেষণ';

  @override
  String get navReport => 'রিপোর্ট';

  @override
  String get navMyIssues => 'আমার সমস্যা';

  @override
  String get navProfile => 'প্রোফাইল';

  @override
  String get goodMorning => 'শুভ সকাল,';

  @override
  String get goodAfternoon => 'শুভ অপরাহ্ন,';

  @override
  String get goodEvening => 'শুভ সন্ধ্যা,';

  @override
  String get welcomeCitizen => 'নাগরিক';

  @override
  String get searchHint => 'রিপোর্ট, রাস্তার সমস্যা, বাতি খুঁজুন...';

  @override
  String get cityReportsOverview => 'শহরের সামগ্রিক চিত্র';

  @override
  String get infrastructureCategories => 'অবকাঠামোর বিভাগসমূহ';

  @override
  String get recentCommunityReports => 'সাম্প্রতিক নাগরিক রিপোর্ট';

  @override
  String get viewAll => 'সব দেখুন';

  @override
  String get reportAnIssue => 'সমস্যা রিপোর্ট করুন';

  @override
  String get reportSubtitle => 'নাগরিক সমস্যা রিপোর্ট করে শহর সুন্দর রাখুন';

  @override
  String get totalReports => 'মোট রিপোর্ট';

  @override
  String get inProgress => 'চলমান কাজ';

  @override
  String get resolved => 'সমাধান হয়েছে';

  @override
  String get critical => 'জরুরি সমস্যা';

  @override
  String get categoryRoad => 'রাস্তাঘাট ও সড়ক';

  @override
  String get categoryWater => 'পানি ও পয়ঃনিষ্কাশন';

  @override
  String get categoryLighting => 'রাস্তার বাতি';

  @override
  String get categoryWaste => 'বর্জ্য ও পরিচ্ছন্নতা';

  @override
  String get categorySafety => 'জননিরাপত্তা';

  @override
  String get categoryParks => 'পার্ক ও পরিবেশ';

  @override
  String get categoryHazard => 'বিপদজনক';

  @override
  String get statusPending => 'অপেক্ষমাণ';

  @override
  String get statusInProgress => 'চলমান';

  @override
  String get statusResolved => 'সমাধান হয়েছে';

  @override
  String get statusRejected => 'প্রত্যাখ্যাত';

  @override
  String get priorityUrgent => 'জরুরি';

  @override
  String get priorityHigh => 'উচ্চ';

  @override
  String get priorityMedium => 'মাঝারি';

  @override
  String get priorityLow => 'সাধারণ';

  @override
  String get exploreTitle => 'সমস্যা অন্বেষণ';

  @override
  String get exploreSubtitle =>
      'শহর জুড়ে নাগরিক অবকাঠামো সমস্যার সরাসরি আপডেট দেখুন';

  @override
  String get allStatus => 'সব স্ট্যাটাস';

  @override
  String get myProfile => 'আমার প্রোফাইল';

  @override
  String get civicImpact => 'আমার নাগরিক অবদান ও ব্যাজ';

  @override
  String get civicImpactSubtitle => 'ইমপ্যাক্ট স্কোর, র‍্যাংকিং ও ব্যাজ';

  @override
  String get notificationPreferences => 'বিজ্ঞপ্তি পছন্দসমূহ';

  @override
  String get language => 'ভাষা';

  @override
  String get languageSubtitle => 'ইংরেজি বা বাংলা নির্বাচন করুন';

  @override
  String get english => 'English (ইংরেজি)';

  @override
  String get bangla => 'বাংলা (Bangla)';

  @override
  String get changeLanguage => 'ভাষা পরিবর্তন করুন';

  @override
  String get signOut => 'লগআউট';

  @override
  String get signOutConfirm => 'আপনি কি নিশ্চিত যে লগআউট করতে চান?';

  @override
  String get cancel => 'বাতিল';

  @override
  String get confirm => 'নিশ্চিত করুন';

  @override
  String get premiumUpgrade => 'প্রিমিয়াম মেম্বারশিপ নিন';

  @override
  String get premiumActive => 'প্রিমিয়াম সক্রিয়';

  @override
  String get reportIssueTitle => 'অবকাঠামো সমস্যা রিপোর্ট করুন';

  @override
  String get titleLabel => 'সমস্যার শিরোনাম';

  @override
  String get categoryLabel => 'বিভাগ নির্বাচন করুন';

  @override
  String get descriptionLabel => 'বিস্তারিত বিবরণ';

  @override
  String get locationLabel => 'অবস্থান';

  @override
  String get uploadPhoto => 'ছবি সংযুক্ত করুন';

  @override
  String get submitReport => 'রিপোর্ট জমা দিন';

  @override
  String get submitting => 'জমা হচ্ছে...';

  @override
  String get reportSuccess => 'রিপোর্ট সফলভাবে জমা হয়েছে!';

  @override
  String ticketNumber(String id) {
    return 'টিকেট #$id';
  }

  @override
  String upvotesCount(int count) {
    return '$count ভোট';
  }

  @override
  String commentsCount(int count) {
    return '$count মন্তব্য';
  }
}
