import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/timeline_step_tile.dart';

/// Timeline progress tracker page showing issue status history.
class IssueTimelinePage extends StatelessWidget {
  final String issueId;

  const IssueTimelinePage({super.key, required this.issueId});

  @override
  Widget build(BuildContext context) {
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
          children: const [
            TimelineStepTile(
              title: 'Report Submitted',
              subtitle: 'Report received with 3 photo evidence attachments',
              isCompleted: true,
            ),
            TimelineStepTile(
              title: 'Verified by Staff',
              subtitle: 'Automated triage approved by Ward 4 Supervisor',
              isCompleted: true,
            ),
            TimelineStepTile(
              title: 'Crew Dispatched',
              subtitle: 'Field crew unit #12 en route (PW-TRK-402)',
              isCompleted: true,
              isCurrent: true,
            ),
            TimelineStepTile(
              title: 'Repairs in Progress',
              subtitle: 'Pothole excavation and bitumen application',
              isCompleted: false,
            ),
            TimelineStepTile(
              title: 'Inspection & Resolved',
              subtitle:
                  'Quality review check and post-repair photographic clearance',
              isCompleted: false,
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }
}
