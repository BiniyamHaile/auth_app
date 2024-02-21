part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpUserEvent extends SignUpEvent {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String confirmPassword;

  SignUpUserEvent({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.confirmPassword,
  });
}
