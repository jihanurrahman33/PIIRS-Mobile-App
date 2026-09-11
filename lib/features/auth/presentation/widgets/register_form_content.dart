import 'package:flutter/material.dart';

import '../../../../core/widgets/app_snackbar.dart';
import 'auth_header_widget.dart';
import 'register_bottom_actions.dart';
import 'register_form_fields.dart';

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
  bool _accepted = false;

  @override
  void dispose() {
    for (final c in [_name, _email, _pwd]) {
      c.dispose();
    }
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (!_accepted) {
      AppSnackBar.showWarning(context, 'Please accept Terms of Service.');
      return;
    }
    widget.onRegister(_name.text.trim(), _email.text.trim(), _pwd.text);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AuthHeaderWidget(
                title: 'Create Account',
                subtitle: 'Join PIIRS to report and track issues',
                icon: Icons.person_add_rounded,
              ),
              const SizedBox(height: 32),
              RegisterFormFields(
                nameController: _name,
                emailController: _email,
                passwordController: _pwd,
                acceptedTerms: _accepted,
                onTermsChanged: (v) => setState(() => _accepted = v ?? false),
              ),
              const SizedBox(height: 24),
              RegisterBottomActions(
                onSubmit: _submit,
                isLoading: widget.isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
