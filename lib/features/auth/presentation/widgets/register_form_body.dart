import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/register_terms_bloc.dart';
import '../bloc/register_terms_event.dart';
import 'auth_header_widget.dart';
import 'register_bottom_actions.dart';
import 'register_form_fields.dart';

/// Form body layout for user registration.
class RegisterFormBody extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSubmit;
  final bool isLoading;

  const RegisterFormBody({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.onSubmit,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AuthHeaderWidget(
          title: 'Create Account',
          subtitle: 'Join PIIRS to report and track issues',
          icon: Icons.person_add_rounded,
        ),
        const SizedBox(height: 32),
        BlocBuilder<RegisterTermsBloc, bool>(
          builder: (context, accepted) {
            return RegisterFormFields(
              nameController: nameController,
              emailController: emailController,
              passwordController: passwordController,
              acceptedTerms: accepted,
              onTermsChanged: (v) => context.read<RegisterTermsBloc>().add(
                ToggleTermsEvent(v ?? false),
              ),
            );
          },
        ),
        const SizedBox(height: 24),
        RegisterBottomActions(onSubmit: onSubmit, isLoading: isLoading),
      ],
    );
  }
}
