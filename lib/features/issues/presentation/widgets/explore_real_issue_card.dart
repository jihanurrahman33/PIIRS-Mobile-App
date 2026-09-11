import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/issue_entity.dart';
import 'explore_issue_card.dart';

/// Renders a live domain IssueEntity inside an ExploreIssueCard.
class ExploreRealIssueCard extends StatelessWidget {
  final IssueEntity issue;

  const ExploreRealIssueCard({super.key, required this.issue});

  String _formatLocation(IssueEntity issue) {
    if (issue.latitude == null || issue.longitude == null) {
      return 'Reported Area';
    }
    return '${issue.latitude!.toStringAsFixed(2)}, '
        '${issue.longitude!.toStringAsFixed(2)}';
  }

  String _formatReporter(String email) {
    if (!email.contains('@')) return 'Citizen';
    final name = email.split('@').first;
    return name.isEmpty ? 'Citizen' : name;
  }

  String _formatTimeAgo(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inDays > 0) return '${diff.inDays}d ago';
    if (diff.inHours > 0) return '${diff.inHours}h ago';
    if (diff.inMinutes > 0) return '${diff.inMinutes}m ago';
    return 'Just now';
  }

  String _formatPriority(IssueEntity issue) {
    final cat = issue.category.toLowerCase();
    final desc = issue.description.toLowerCase();
    if (cat.contains('hazard') || desc.contains('urgent')) {
      return 'URGENT';
    }
    return 'HIGH';
  }

  @override
  Widget build(BuildContext context) {
    final id = issue.id.length > 8
        ? issue.id.substring(0, 8).toUpperCase()
        : issue.id;

    return ExploreIssueCard(
      title: issue.title,
      location: _formatLocation(issue),
      priority: _formatPriority(issue),
      status: issue.status,
      reporter:
          '${_formatReporter(issue.authorEmail)} • ${_formatTimeAgo(issue.createdAt)}',
      id: id,
      upvotes: issue.upvotes,
      comments: 0,
      onTap: () => context.push('/issues/details/${issue.id}'),
    );
  }
}
