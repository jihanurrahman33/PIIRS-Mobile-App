import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/status_badge.dart';

/// Sub-view listing user's rejected issue reports with rejection notices.
class RejectedIssuesPage extends StatelessWidget {
  const RejectedIssuesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rejected Reports'),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemCount: 1,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const StatusBadge(status: 'Rejected'),
                  const SizedBox(height: 8),
                  Text(
                    'Private property drainage request',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Rejection Reason: System handles public municipal infrastructure only.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.rejected,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
