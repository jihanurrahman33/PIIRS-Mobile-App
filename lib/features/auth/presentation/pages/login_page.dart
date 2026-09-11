import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_snackbar.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/login_form_content.dart';

/// Login Page UI for PIIRS user authentication.
class LoginPage extends StatefulWidget {
  final AuthBloc? bloc;
  const LoginPage({super.key, this.bloc});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _pwd = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _pwd.dispose();
    super.dispose();
  }

  void _onLogin(AuthBloc? bloc) {
    if (_formKey.currentState?.validate() ?? false) {
      bloc?.add(
        LoginRequestedEvent(email: _email.text.trim(), password: _pwd.text),
      );
    }
  }

  void _onState(BuildContext context, AuthState state) {
    if (state is AuthenticatedState) context.go('/home');
    if (state is AccountBlockedState) context.push('/account-blocked');
    if (state is AuthFailureState) {
      AppSnackBar.showError(context, state.failure.message);
    }
  }

  AuthBloc? _resolveBloc(BuildContext context) {
    try {
      return widget.bloc ?? context.read<AuthBloc>();
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = _resolveBloc(context);
    Widget body(bool loading) => Scaffold(
      body: SafeArea(
        child: LoginFormContent(
          formKey: _formKey,
          emailController: _email,
          passwordController: _pwd,
          onLogin: () => _onLogin(bloc),
          isLoading: loading,
        ),
      ),
    );

    if (bloc == null) return body(false);
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: bloc,
      listener: _onState,
      builder: (context, state) => body(state is AuthLoadingState),
    );
  }
}
