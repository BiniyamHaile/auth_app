import 'package:authapp/data/api/change_password/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(ChangePasswordInitial()) {
    on<ChangePasswordEvent>((event, emit) {});
    on<ChangePasswordUserEvent>(_handleChangePasswordUser);
  }
  final ChangePasswordApiService _changePasswordApiService =
      ChangePasswordApiService();
  Future<void> _handleChangePasswordUser(
      ChangePasswordUserEvent event, Emitter<ChangePasswordState> emit) async {
    emit(ChangePasswordLoading());
    await _changePasswordApiService
        .changePassword(
          email: event.email,
          oldPassword: event.oldPassword,
          newPassword: event.newPassword,
          confirmPassword: event.confirmPassword,
        )
        .onError(
            (error, stackTrace) => emit(ChangePasswordError(error.toString())))
        .then((value) => emit(ChangePasswordSuccess()));
  }
}
