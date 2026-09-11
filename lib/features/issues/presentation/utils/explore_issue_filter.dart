import '../../domain/entities/issue_entity.dart';

/// Utility to filter issue entities by status tab on explore screen.
class ExploreIssueFilter {
  static List<IssueEntity> filter(List<IssueEntity> list, String s) {
    final st = s.toLowerCase();
    if (st == 'pending') {
      return list
          .where((i) => i.status.toLowerCase().contains('pending'))
          .toList();
    }
    if (st == 'in progress') {
      return list
          .where((i) => i.status.toLowerCase().contains('progress'))
          .toList();
    }
    if (st == 'resolved') {
      return list
          .where((i) => i.status.toLowerCase().contains('resolved'))
          .toList();
    }
    if (st == 'urgent') {
      return list
          .where(
            (i) =>
                i.category.toLowerCase().contains('hazard') ||
                i.description.toLowerCase().contains('urgent'),
          )
          .toList();
    }
    return list;
  }
}
