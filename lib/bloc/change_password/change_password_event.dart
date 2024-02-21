part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object> get props => [];
}

class ChangePasswordUserEvent extends ChangePasswordEvent {
  final String email;
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;

  const ChangePasswordUserEvent({
    required this.email,
    required this.oldPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  @override
  List<Object> get props => [email, oldPassword, newPassword];
}
