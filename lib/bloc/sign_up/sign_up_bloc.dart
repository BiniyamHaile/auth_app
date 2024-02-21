import 'package:authapp/data/api/sign_up/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpUserEvent>(_handleSignUpUser);
  }

  final SignUpApiService _signUpApiService = SignUpApiService();
  Future<void> _handleSignUpUser(
      SignUpUserEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());

    await _signUpApiService
        .signUpUser(
            email: event.email,
            password: event.password,
            firstName: event.firstName,
            lastName: event.lastName,
            confirmPassword: event.confirmPassword)
        .onError((error, stackTrace) => emit(SignUpError(error.toString())))
        .then((value) => emit(SignUpSuccess()));
  }
}
