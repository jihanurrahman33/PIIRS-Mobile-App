import 'package:flutter/material.dart';

import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/widgets.dart';

/// Form widget to request password reset link by email.
class ForgotPasswordRequestForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final VoidCallback onSubmit;

  const ForgotPasswordRequestForm({
    super.key,
    required this.formKey,
    required this.controller,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AppHeader(
            title: 'Reset Password',
            subtitle:
                'Enter your account email address and we will send you a password reset link.',
            icon: Icons.lock_reset_rounded,
          ),
          const SizedBox(height: 32),
          AppTextField(
            controller: controller,
            label: 'Email Address',
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            validator: Validators.validateEmail,
          ),
          const SizedBox(height: 24),
          AppButton(text: 'Send Reset Link', onPressed: onSubmit),
        ],
      ),
    );
  }
}
