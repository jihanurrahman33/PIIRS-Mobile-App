import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_snackbar.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/register_form_content.dart';

/// Registration Page UI for creating new citizen accounts.
class RegisterPage extends StatelessWidget {
  final AuthBloc? bloc;
  const RegisterPage({super.key, this.bloc});

  void _onRegister(
    BuildContext context,
    AuthBloc? b,
    String n,
    String e,
    String p,
  ) {
    if (b != null) {
      b.add(RegisterRequestedEvent(name: n, email: e, password: p));
    } else {
      context.go('/home');
    }
  }

  void _onState(BuildContext context, AuthState state) {
    if (state is AuthenticatedState) {
      AppSnackBar.showSuccess(context, 'Account created successfully!');
      context.go('/home');
    } else if (state is AuthFailureState) {
      AppSnackBar.showError(context, state.failure.message);
    }
  }

  AuthBloc? _resolveBloc(BuildContext context) {
    try {
      return bloc ?? context.read<AuthBloc>();
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final b = _resolveBloc(context);
    Widget scaffold(bool loading) => Scaffold(
      appBar: AppBar(leading: BackButton(onPressed: () => context.pop())),
      body: SafeArea(
        child: RegisterFormContent(
          onRegister: (n, e, p) => _onRegister(context, b, n, e, p),
          isLoading: loading,
        ),
      ),
    );

    if (b == null) return scaffold(false);
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: b,
      listener: _onState,
      builder: (context, state) => scaffold(state is AuthLoadingState),
    );
  }
}
