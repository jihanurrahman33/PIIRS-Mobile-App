import 'package:equatable/equatable.dart';

/// State representing submission of password reset request.
class ForgotPasswordState extends Equatable {
  final bool isSubmitted;
  final String email;

  const ForgotPasswordState({this.isSubmitted = false, this.email = ''});

  @override
  List<Object?> get props => [isSubmitted, email];
}
