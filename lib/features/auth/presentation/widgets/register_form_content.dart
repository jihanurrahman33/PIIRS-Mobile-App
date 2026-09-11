import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_snackbar.dart';
import '../bloc/register_terms_bloc.dart';
import 'register_form_body.dart';

/// Form content managing inputs and validation for citizen registration.
class RegisterFormContent extends StatefulWidget {
  final void Function(String, String, String) onRegister;
  final bool isLoading;

  const RegisterFormContent({
    super.key,
    required this.onRegister,
    this.isLoading = false,
  });

  @override
  State<RegisterFormContent> createState() => _RegisterFormContentState();
}

class _RegisterFormContentState extends State<RegisterFormContent> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController(),
      _email = TextEditingController(),
      _pwd = TextEditingController();

  @override
  void dispose() {
    for (final c in [_name, _email, _pwd]) {
      c.dispose();
    }
    super.dispose();
  }

  void _submit(BuildContext ctx) {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final accepted = ctx.read<RegisterTermsBloc>().state;
    if (!accepted) {
      AppSnackBar.showWarning(context, 'Please accept Terms of Service.');
      return;
    }
    widget.onRegister(_name.text.trim(), _email.text.trim(), _pwd.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterTermsBloc(),
      child: Builder(
        builder: (ctx) => Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Form(
              key: _formKey,
              child: RegisterFormBody(
                nameController: _name,
                emailController: _email,
                passwordController: _pwd,
                onSubmit: () => _submit(ctx),
                isLoading: widget.isLoading,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
