import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_animations.dart';

/// Welcome Entry Screen providing choices for Sign In, Registration, or Guest Browse.
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              const Spacer(),
              // Hero Branding
              FadeInSlide(
                child: Column(
                  children: [
                    Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        color: AppColors.primarySeed,
                        borderRadius: BorderRadius.circular(24.0),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primarySeed.withValues(alpha: 0.4),
                            blurRadius: 24,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.bolt_rounded,
                        size: 56,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Welcome to ZapShift',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Report infrastructure issues, track city repair progress, and collaborate with municipal staff.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Action Buttons
              FadeInSlide(
                direction: SlideDirection.up,
                delay: const Duration(milliseconds: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () => context.push('/login'),
                      child: const Text('Sign In'),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton(
                      onPressed: () => context.push('/register'),
                      child: const Text('Create Account'),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () => context.go('/home'),
                      child: Text(
                        'Continue as Guest',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
