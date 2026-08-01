import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';

/// Timeline progress tracker page showing issue status history.
class IssueTimelinePage extends StatelessWidget {
  final String issueId;

  const IssueTimelinePage({
    super.key,
    required this.issueId,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: Text('Timeline - #$issueId'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            _buildTimelineTile(
              theme,
              title: 'Report Submitted',
              subtitle: 'Report received by system on Aug 1, 10:00 AM',
              isCompleted: true,
            ),
            _buildTimelineTile(
              theme,
              title: 'Staff Assigned',
              subtitle: 'Assigned to Staff Worker (Roads Dept)',
              isCompleted: true,
            ),
            _buildTimelineTile(
              theme,
              title: 'In Progress',
              subtitle: 'Repair crew dispatched to site',
              isCompleted: true,
              isCurrent: true,
            ),
            _buildTimelineTile(
              theme,
              title: 'Resolved',
              subtitle: 'Pending site inspection completion',
              isCompleted: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineTile(
    ThemeData theme, {
    required String title,
    required String subtitle,
    required bool isCompleted,
    bool isCurrent = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: isCompleted
                  ? AppColors.primarySeed
                  : theme.colorScheme.outlineVariant,
              child: Icon(
                isCurrent ? Icons.sync_rounded : Icons.check_rounded,
                size: 14,
                color: Colors.white,
              ),
            ),
            Container(
              width: 2,
              height: 48,
              color: isCompleted
                  ? AppColors.primarySeed
                  : theme.colorScheme.outlineVariant,
            ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
}
