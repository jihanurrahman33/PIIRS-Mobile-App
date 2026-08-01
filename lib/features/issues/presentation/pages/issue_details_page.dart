import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/widgets.dart';

/// Detailed view screen for a single public infrastructure issue.
class IssueDetailsPage extends StatefulWidget {
  final String issueId;

  const IssueDetailsPage({
    super.key,
    required this.issueId,
  });

  @override
  State<IssueDetailsPage> createState() => _IssueDetailsPageState();
}

class _IssueDetailsPageState extends State<IssueDetailsPage> {
  int _upvotes = 24;
  bool _isUpvoted = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: Text('Issue #${widget.issueId}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const StatusBadge(status: 'In Progress'),
                  Chip(
                    label: const Text('Roads & Potholes'),
                    avatar: const Icon(Icons.category_rounded, size: 16),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Deep Pothole causing traffic delay on Main St',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Reported by citizen@zapshift.com • Sector 4',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () => context.push('/issues/gallery'),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer
                        .withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image_rounded,
                            size: 48, color: theme.colorScheme.primary),
                        const SizedBox(height: 8),
                        Text('Tap to View Photo Gallery',
                            style: theme.textTheme.labelLarge),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Assigned Municipal Staff',
                        style: theme.textTheme.titleSmall
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading:
                          CircleAvatar(child: Icon(Icons.engineering_rounded)),
                      title: Text('Staff Worker (Roads Dept)'),
                      subtitle: Text('staff.roads@zapshift.com'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        setState(() {
                          _isUpvoted = !_isUpvoted;
                          _upvotes += _isUpvoted ? 1 : -1;
                        });
                      },
                      icon: Icon(
                        _isUpvoted
                            ? Icons.thumb_up_alt_rounded
                            : Icons.thumb_up_off_alt_rounded,
                        color: _isUpvoted ? AppColors.primarySeed : null,
                      ),
                      label: Text('Upvote ($_upvotes)'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () =>
                          context.push('/issues/timeline/${widget.issueId}'),
                      icon: const Icon(Icons.timeline_rounded),
                      label: const Text('Timeline'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
