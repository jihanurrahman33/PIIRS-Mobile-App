import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_terms_event.dart';

/// BLoC managing terms and conditions agreement status during signup.
class RegisterTermsBloc extends Bloc<RegisterTermsEvent, bool> {
  RegisterTermsBloc() : super(false) {
    on<ToggleTermsEvent>((event, emit) => emit(event.isAccepted));
  }
}
