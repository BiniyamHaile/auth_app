import 'package:authapp/data/api/login/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});
    on<LoginUserEvent>(_handleLoginUser);
  }
  final LoginApiService _loginApiService = LoginApiService();

  Future<void> _handleLoginUser(
      LoginUserEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      await _loginApiService
        .loginUser(
          email: event.email,
          password: event.password,
        );
        emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(e.toString()));
    }
      
  }
}
