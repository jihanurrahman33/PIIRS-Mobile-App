import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/issue_department_assignment_widget.dart';
import '../widgets/issue_details_header_section.dart';
import '../widgets/issue_endorsement_bar_widget.dart';
import '../widgets/issue_location_snippet_widget.dart';
import '../widgets/issue_resolution_stepper_widget.dart';

/// Detailed incident resolution & progress screen for a single issue report.
class IssueDetailsPage extends StatefulWidget {
  final String issueId;

  const IssueDetailsPage({super.key, required this.issueId});

  @override
  State<IssueDetailsPage> createState() => _IssueDetailsPageState();
}

class _IssueDetailsPageState extends State<IssueDetailsPage> {
  int _upvotes = 24;
  bool _isUpvoted = false;

  void _onUpvote() {
    setState(() {
      _isUpvoted = !_isUpvoted;
      _upvotes += _isUpvoted ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: Text('Issue #${widget.issueId}'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            IssueDetailsHeaderSection(
              onGalleryTap: () => context.push('/issues/gallery'),
            ),
            const SizedBox(height: 16),
            IssueEndorsementBarWidget(
              upvotes: _upvotes,
              isUpvoted: _isUpvoted,
              onUpvote: _onUpvote,
              onBoost: () => context.push('/premium'),
            ),
            const SizedBox(height: 16),
            const IssueDepartmentAssignmentWidget(),
            const SizedBox(height: 16),
            IssueResolutionStepperWidget(
              onViewFullTimeline: () =>
                  context.push('/issues/timeline/${widget.issueId}'),
            ),
            const SizedBox(height: 16),
            IssueLocationSnippetWidget(
              onOpenMap: () => context.push('/issues/location-picker'),
            ),
          ],
        ),
      ),
    );
  }
}
