import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'auth_header_widget.dart';
import 'login_bottom_actions.dart';
import 'login_form_fields.dart';

/// Form content widget containing header, inputs, and submit actions for login.
class LoginFormContent extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onLogin;
  final bool isLoading;

  const LoginFormContent({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.onLogin,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AuthHeaderWidget(
                title: 'Welcome Back',
                subtitle: 'Sign in to manage and report public issues',
              ),
              const SizedBox(height: 32),
              LoginFormFields(
                emailController: emailController,
                passwordController: passwordController,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => context.push('/forgot-password'),
                  child: const Text('Forgot Password?'),
                ),
              ),
              const SizedBox(height: 16),
              LoginBottomActions(onLogin: onLogin, isLoading: isLoading),
            ],
          ),
        ),
      ),
    );
  }
}
