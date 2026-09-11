import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_outlined_button.dart';
import '../widgets/report_celebration_badge_widget.dart';
import '../widgets/report_next_steps_widget.dart';
import '../widgets/report_ticket_summary_card.dart';

/// Confirmation screen displayed immediately after creating an issue report.
class ReportSuccessPage extends StatelessWidget {
  const ReportSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.close_rounded),
                  onPressed: () => context.go('/home'),
                ),
              ),
              const ReportCelebrationBadgeWidget(),
              const SizedBox(height: 16),
              const ReportTicketSummaryCard(),
              const SizedBox(height: 16),
              const ReportNextStepsWidget(),
              const SizedBox(height: 20),
              AppButton(
                text: 'Track Issue Status',
                onPressed: () => context.go('/my-issues'),
              ),
              const SizedBox(height: 12),
              AppOutlinedButton(
                text: 'Back to Home',
                onPressed: () => context.go('/home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
