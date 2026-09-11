import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_button.dart';
import '../widgets/report_anonymous_toggle.dart';
import '../widgets/report_issue_form_fields.dart';
import '../widgets/report_media_upload_widget.dart';

/// Report Issue Tab Page conforming to Stitch Civic Modern UI architecture.
class ReportIssuePage extends StatefulWidget {
  const ReportIssuePage({super.key});

  @override
  State<ReportIssuePage> createState() => _ReportIssuePageState();
}

class _ReportIssuePageState extends State<ReportIssuePage> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  String _priority = 'Urgent';
  bool _isAnonymous = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Report New Issue')),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ReportMediaUploadWidget(),
              const SizedBox(height: 14),
              ReportIssueFormFields(
                titleController: _titleController,
                descController: _descController,
                selectedPriority: _priority,
                onPriorityChanged: (p) => setState(() => _priority = p),
              ),
              const SizedBox(height: 14),
              ReportAnonymousToggle(
                value: _isAnonymous,
                onChanged: (val) => setState(() => _isAnonymous = val),
              ),
              const SizedBox(height: 16),
              AppButton(
                text: 'Submit Issue Report',
                onPressed: () => context.push('/issues/success'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
