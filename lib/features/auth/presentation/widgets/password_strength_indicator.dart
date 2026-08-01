import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Live password strength meter widget.
class PasswordStrengthIndicator extends StatelessWidget {
  final String password;

  const PasswordStrengthIndicator({
    super.key,
    required this.password,
  });

  int _calculateStrength() {
    if (password.isEmpty) return 0;
    int score = 0;
    if (password.length >= 8) score++;
    if (RegExp(r'[A-Z]').hasMatch(password)) score++;
    if (RegExp(r'[0-9]').hasMatch(password)) score++;
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) score++;
    return score;
  }

  @override
  Widget build(BuildContext context) {
    if (password.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final score = _calculateStrength();

    Color color;
    String label;
    double progress;

    switch (score) {
      case 1:
        color = AppColors.rejected;
        label = 'Weak';
        progress = 0.25;
        break;
      case 2:
        color = AppColors.pending;
        label = 'Fair';
        progress = 0.50;
        break;
      case 3:
        color = AppColors.inProgress;
        label = 'Good';
        progress = 0.75;
        break;
      case 4:
      default:
        color = AppColors.resolved;
        label = 'Strong';
        progress = 1.0;
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 6),
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: theme.colorScheme.outlineVariant,
                  color: color,
                  minHeight: 4.0,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
