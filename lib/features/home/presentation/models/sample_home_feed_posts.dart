import 'home_feed_post_item.dart';

/// Sample seed posts representing civic issues for the citizen home feed.
abstract final class SampleHomeFeedPosts {
  static const List<HomeFeedPostItem> items = [
    HomeFeedPostItem(
      id: '101',
      title: 'Deep hazardous pothole on Main Street near intersection',
      description:
          'Large crater causing vehicle damage and traffic bottleneck.',
      location: 'Downtown Sector 4',
      status: 'In Progress',
      upvotes: 24,
      commentCount: 8,
      timeAgo: '2h ago',
      reporterName: 'Marcus Vance',
      imagePath: 'assets/stitch/pothole_hazard.png',
      category: 'Roads & Potholes',
    ),
    HomeFeedPostItem(
      id: '102',
      title: 'Flickering and dead streetlights along 5th Avenue',
      description:
          'Entire block is dark after dusk, creating hazards for pedestrians.',
      location: 'West Avenue Blvd',
      status: 'Pending',
      upvotes: 15,
      commentCount: 4,
      timeAgo: '4h ago',
      reporterName: 'Sarah Jenkins',
      category: 'Street Lighting',
    ),
    HomeFeedPostItem(
      id: '103',
      title: 'Major water line rupture on Pine & 8th',
      description:
          'Clean water gushing onto roadway with high risk of road erosion.',
      location: 'Pine Street District',
      status: 'Resolved',
      upvotes: 38,
      commentCount: 12,
      timeAgo: '1d ago',
      reporterName: 'David Kim',
      category: 'Water Supply',
    ),
  ];
}
