import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/widgets.dart';
import '../bloc/countdown_timer_bloc.dart';
import '../bloc/countdown_timer_event.dart';
import '../bloc/forgot_password_bloc.dart';
import '../bloc/forgot_password_event.dart';
import '../bloc/forgot_password_state.dart';
import '../widgets/forgot_password_request_form.dart';
import '../widgets/forgot_password_submitted_view.dart';

/// Password reset link request screen powered by BLoC.
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleSend(BuildContext context) {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final email = _emailController.text.trim();
    context.read<ForgotPasswordBloc>().add(SubmitResetRequestEvent(email));
    context.read<CountdownTimerBloc>().add(const StartCountdownTimerEvent());
    AppSnackBar.showSuccess(context, 'Password reset link sent to $email');
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ForgotPasswordBloc()),
        BlocProvider(create: (_) => CountdownTimerBloc(initialSeconds: 0)),
      ],
      child: Builder(
        builder: (ctx) => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () => context.pop(),
            ),
          ),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                  builder: (context, state) => state.isSubmitted
                      ? ForgotPasswordSubmittedView(
                          email: state.email,
                          onResend: () => _handleSend(ctx),
                        )
                      : ForgotPasswordRequestForm(
                          formKey: _formKey,
                          controller: _emailController,
                          onSubmit: () => _handleSend(ctx),
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
