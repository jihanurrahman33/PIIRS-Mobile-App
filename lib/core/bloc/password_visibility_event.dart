import 'package:equatable/equatable.dart';

/// Base event for PasswordVisibilityBloc.
abstract class PasswordVisibilityEvent extends Equatable {
  const PasswordVisibilityEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggered when eye icon is tapped to toggle obscure text.
class TogglePasswordVisibilityEvent extends PasswordVisibilityEvent {
  const TogglePasswordVisibilityEvent();
}
