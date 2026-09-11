import 'package:flutter_bloc/flutter_bloc.dart';

import 'password_visibility_event.dart';

/// BLoC managing obscure text visibility state for password inputs.
class PasswordVisibilityBloc extends Bloc<PasswordVisibilityEvent, bool> {
  PasswordVisibilityBloc() : super(true) {
    on<TogglePasswordVisibilityEvent>((event, emit) => emit(!state));
  }
}
