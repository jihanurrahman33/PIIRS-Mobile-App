import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';

/// Summary card displaying metadata for a newly filed report ticket.
class ReportTicketSummaryCard extends StatelessWidget {
  const ReportTicketSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primarySeed.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tracking Ticket ID',
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    Text(
                      '#PIIRS-84920',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.copy_rounded,
                  size: 18,
                  color: AppColors.primarySeed,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _buildMetaRow('Category', 'Road Hazard & Infrastructure ⚠️'),
          const Divider(height: 16),
          _buildMetaRow('Location', '742 Evergreen Terrace, Ward 4 📍'),
          const Divider(height: 16),
          _buildMetaRow('Priority', 'Urgent (Safety Flagged) 🚨'),
        ],
      ),
    );
  }

  Widget _buildMetaRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 13, color: Colors.grey)),
        Text(
          value,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
