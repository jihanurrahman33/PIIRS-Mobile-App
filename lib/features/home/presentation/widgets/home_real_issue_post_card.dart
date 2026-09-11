import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../issues/domain/entities/issue_entity.dart';
import 'home_recent_report_card.dart';

/// Renders a real IssueEntity inside a HomeRecentReportCard.
class HomeRealIssuePostCard extends StatelessWidget {
  final IssueEntity issue;

  const HomeRealIssuePostCard({super.key, required this.issue});

  String _formatReporter(String email) {
    if (!email.contains('@')) return 'Citizen Reporter';
    final name = email.split('@').first;
    return name.isEmpty ? 'Citizen Reporter' : name;
  }

  String _formatLocation(IssueEntity issue) {
    if (issue.latitude == null || issue.longitude == null) {
      return 'Reported Location';
    }
    return '${issue.latitude!.toStringAsFixed(2)}, '
        '${issue.longitude!.toStringAsFixed(2)}';
  }

  String _formatTimeAgo(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inDays > 0) return '${diff.inDays}d ago';
    if (diff.inHours > 0) return '${diff.inHours}h ago';
    if (diff.inMinutes > 0) return '${diff.inMinutes}m ago';
    return 'Just now';
  }

  @override
  Widget build(BuildContext context) {
    return HomeRecentReportCard(
      title: issue.title,
      description: issue.description,
      location: _formatLocation(issue),
      status: issue.status,
      upvotes: issue.upvotes,
      timeAgo: _formatTimeAgo(issue.createdAt),
      reporterName: _formatReporter(issue.authorEmail),
      imagePath: issue.imageUrl,
      category: issue.category,
      onTap: () => context.push('/issues/details/${issue.id}'),
    );
  }
}
