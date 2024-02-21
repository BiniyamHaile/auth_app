part of 'change_password_bloc.dart';

sealed class ChangePasswordState extends Equatable {
  @override
  List<Object> get props => [];
}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangePasswordLoading extends ChangePasswordState {}

final class ChangePasswordSuccess extends ChangePasswordState {}

final class ChangePasswordError extends ChangePasswordState {
  final String message;

  ChangePasswordError(this.message);

  @override
  List<Object> get props => [message];
}
