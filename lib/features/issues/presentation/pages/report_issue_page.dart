import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/widgets.dart';
import '../widgets/report_location_card_widget.dart';
import '../widgets/report_media_upload_widget.dart';
import '../widgets/report_priority_selector_widget.dart';

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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ReportMediaUploadWidget(),
              const SizedBox(height: 14),
              AppTextField(
                controller: _titleController,
                label: 'Issue Title',
                prefixIcon: Icons.title_rounded,
              ),
              const SizedBox(height: 14),
              ReportPrioritySelectorWidget(
                selectedPriority: _priority,
                onPriorityChanged: (p) => setState(() => _priority = p),
              ),
              const SizedBox(height: 14),
              ReportLocationCardWidget(
                onAdjustMap: () => context.push('/issues/location-picker'),
              ),
              const SizedBox(height: 14),
              AppTextField(
                controller: _descController,
                label: 'Detailed Description',
                prefixIcon: Icons.description_rounded,
              ),
              const SizedBox(height: 14),
              SwitchListTile(
                value: _isAnonymous,
                onChanged: (val) => setState(() => _isAnonymous = val),
                title: const Text(
                  'Report Anonymously',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                subtitle: const Text(
                  'Hides your name and badge from public view',
                  style: TextStyle(fontSize: 11),
                ),
                contentPadding: EdgeInsets.zero,
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
