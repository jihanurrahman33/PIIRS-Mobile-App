import 'package:flutter_bloc/flutter_bloc.dart';

import 'forgot_password_event.dart';
import 'forgot_password_state.dart';

/// BLoC managing password reset link request submission.
class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(const ForgotPasswordState()) {
    on<SubmitResetRequestEvent>((event, emit) {
      emit(ForgotPasswordState(isSubmitted: true, email: event.email));
    });
  }
}
