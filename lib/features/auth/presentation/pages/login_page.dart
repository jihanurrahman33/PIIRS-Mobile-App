import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/auth_header_widget.dart';
import '../widgets/login_bottom_actions.dart';
import '../widgets/login_form_fields.dart';

/// Login Page UI for PIIRS user authentication.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AuthHeaderWidget(
                    title: 'Welcome Back',
                    subtitle: 'Sign in to manage and report public issues',
                  ),
                  const SizedBox(height: 32),
                  LoginFormFields(
                    emailController: _emailController,
                    passwordController: _passwordController,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => context.push('/forgot-password'),
                      child: const Text('Forgot Password?'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  LoginBottomActions(onLogin: _handleLogin),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
