import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/password_visibility_bloc.dart';
import '../bloc/password_visibility_event.dart';
import 'app_text_field.dart';

/// Specialized password text field widget with password visibility BLoC.
class AppPasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String label;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onChanged;

  const AppPasswordField({
    super.key,
    this.controller,
    this.label = 'Password',
    this.validator,
    this.textInputAction = TextInputAction.done,
    this.onChanged,
  });

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  final PasswordVisibilityBloc _bloc = PasswordVisibilityBloc();

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocBuilder<PasswordVisibilityBloc, bool>(
        builder: (context, obscureText) {
          return AppTextField(
            controller: widget.controller,
            label: widget.label,
            prefixIcon: Icons.lock_outline_rounded,
            obscureText: obscureText,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: widget.textInputAction,
            validator: widget.validator,
            onChanged: widget.onChanged,
            suffixIcon: IconButton(
              icon: Icon(
                obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
              ),
              onPressed: () => _bloc.add(const TogglePasswordVisibilityEvent()),
            ),
          );
        },
      ),
    );
  }
}
