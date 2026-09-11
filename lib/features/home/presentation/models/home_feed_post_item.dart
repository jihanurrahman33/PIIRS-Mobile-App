/// Representation of a community issue feed post on the home dashboard.
class HomeFeedPostItem {
  final String id;
  final String title;
  final String description;
  final String location;
  final String status;
  final int upvotes;
  final int commentCount;
  final String timeAgo;
  final String reporterName;
  final String? imagePath;
  final String category;

  const HomeFeedPostItem({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.status,
    required this.upvotes,
    required this.commentCount,
    required this.timeAgo,
    required this.reporterName,
    this.imagePath,
    required this.category,
  });
}
