import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';

/// Sign out list tile for profile settings card.
class ProfileSignOutTile extends StatelessWidget {
  const ProfileSignOutTile({super.key});

  void _onSignOut(BuildContext context) {
    try {
      context.read<AuthBloc>().add(const LogoutRequestedEvent());
    } catch (_) {}
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.logout_rounded, color: AppColors.rejected),
      title: const Text(
        'Sign Out / লগআউট',
        style: TextStyle(fontSize: 14, color: AppColors.rejected),
      ),
      onTap: () => _onSignOut(context),
    );
  }
}
