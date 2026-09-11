import 'package:flutter/material.dart';

import 'issue_evidence_hero_widget.dart';
import 'issue_status_priority_row.dart';
import 'issue_summary_header_widget.dart';

/// Top section combining evidence photo, status row, and incident title.
class IssueDetailsHeaderSection extends StatelessWidget {
  final VoidCallback onGalleryTap;

  const IssueDetailsHeaderSection({super.key, required this.onGalleryTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IssueEvidenceHeroWidget(onGalleryTap: onGalleryTap),
        const SizedBox(height: 16),
        const IssueStatusPriorityRow(
          status: 'In Progress',
          priority: 'Urgent',
          updatedTime: 'Updated 14m ago',
        ),
        const SizedBox(height: 12),
        const IssueSummaryHeaderWidget(
          title: 'Major Pothole Damaging Vehicles',
          description: 'Deep crater near pedestrian crosswalk causing hazards.',
          reporterInfo: 'Reported by citizen@piirs.gov • Ward 4',
        ),
      ],
    );
  }
}
