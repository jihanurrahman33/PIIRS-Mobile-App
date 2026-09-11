import 'package:flutter/material.dart';

import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/widgets.dart';
import 'password_strength_indicator.dart';
import 'terms_and_conditions_checkbox.dart';

/// Form fields group for user registration inputs and terms checkbox.
class RegisterFormFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool acceptedTerms;
  final ValueChanged<bool?> onTermsChanged;

  const RegisterFormFields({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.acceptedTerms,
    required this.onTermsChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          controller: nameController,
          label: 'Full Name',
          prefixIcon: Icons.person_outlined,
          validator: Validators.validateName,
        ),
        const SizedBox(height: 16),
        AppTextField(
          controller: emailController,
          label: 'Email Address',
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
          validator: Validators.validateEmail,
        ),
        const SizedBox(height: 16),
        AppPasswordField(
          controller: passwordController,
          validator: Validators.validatePassword,
        ),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: passwordController,
          builder: (_, val, _) => PasswordStrengthIndicator(password: val.text),
        ),
        const SizedBox(height: 20),
        TermsAndConditionsCheckbox(
          value: acceptedTerms,
          onChanged: onTermsChanged,
        ),
      ],
    );
  }
}
