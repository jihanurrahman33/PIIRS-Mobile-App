import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_snackbar.dart';
import '../bloc/countdown_timer_bloc.dart';
import '../bloc/countdown_timer_event.dart';
import '../widgets/email_verification_body.dart';

/// Email verification pending screen powered by CountdownTimerBloc.
class EmailVerificationPage extends StatefulWidget {
  final String email;

  const EmailVerificationPage({super.key, this.email = 'user@example.com'});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final CountdownTimerBloc _bloc = CountdownTimerBloc(initialSeconds: 60);

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  void _handleResend(BuildContext context) {
    _bloc.add(const StartCountdownTimerEvent());
    AppSnackBar.showSuccess(
      context,
      'Verification email resent to ${widget.email}',
    );
  }

  void _handleVerify(BuildContext context) {
    AppSnackBar.showSuccess(context, 'Email verified! Redirecting to home...');
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Builder(
        builder: (ctx) => Scaffold(
          body: EmailVerificationBody(
            email: widget.email,
            onCheckVerification: () => _handleVerify(ctx),
            onResend: () => _handleResend(ctx),
          ),
        ),
      ),
    );
  }
}
