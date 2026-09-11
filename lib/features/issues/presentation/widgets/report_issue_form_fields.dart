import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_text_field.dart';
import 'report_location_card_widget.dart';
import 'report_priority_selector_widget.dart';

/// Form fields group for reporting an infrastructure issue.
class ReportIssueFormFields extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descController;
  final String selectedPriority;
  final ValueChanged<String> onPriorityChanged;

  const ReportIssueFormFields({
    super.key,
    required this.titleController,
    required this.descController,
    required this.selectedPriority,
    required this.onPriorityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          controller: titleController,
          label: 'Issue Title',
          prefixIcon: Icons.title_rounded,
        ),
        const SizedBox(height: 14),
        ReportPrioritySelectorWidget(
          selectedPriority: selectedPriority,
          onPriorityChanged: onPriorityChanged,
        ),
        const SizedBox(height: 14),
        ReportLocationCardWidget(
          onAdjustMap: () => context.push('/issues/location-picker'),
        ),
        const SizedBox(height: 14),
        AppTextField(
          controller: descController,
          label: 'Detailed Description',
          prefixIcon: Icons.description_rounded,
        ),
      ],
    );
  }
}
