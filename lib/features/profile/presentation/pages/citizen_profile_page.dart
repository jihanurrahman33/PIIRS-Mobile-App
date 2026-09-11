import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/domain/entities/user_entity.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../widgets/profile_header_card.dart';
import '../widgets/profile_settings_list_card.dart';

/// Citizen Profile Tab Page conforming to Stitch profile layout under 80 lines.
class CitizenProfilePage extends StatelessWidget {
  final UserEntity? user;
  const CitizenProfilePage({super.key, this.user});

  AuthBloc? _tryGetBloc(BuildContext context) {
    try {
      return context.read<AuthBloc>();
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = _tryGetBloc(context);
    Widget scaffold(UserEntity? activeUser) => Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ProfileHeaderCard(user: activeUser),
            const SizedBox(height: 14),
            ProfileSettingsListCard(user: activeUser),
          ],
        ),
      ),
    );

    if (bloc != null) {
      return BlocBuilder<AuthBloc, AuthState>(
        bloc: bloc,
        builder: (context, state) {
          final resolved =
              user ?? (state is AuthenticatedState ? state.user : null);
          return scaffold(resolved);
        },
      );
    }
    return scaffold(user);
  }
}
