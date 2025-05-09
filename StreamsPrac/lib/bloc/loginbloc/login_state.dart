part of 'login_bloc.dart';

@immutable
sealed class LoginState {
  late LoginResponse loginResponse;
  LoginState({required this.loginResponse});
}

final class LoginInitial extends LoginState {
  LoginInitial() : super(loginResponse: LoginResponse(status: null, message: null, userDetails: null));
}

final class LoginSuccess extends LoginState {
  LoginSuccess({required LoginResponse loginResponse}) : super(loginResponse: loginResponse);
}

final class LoginFailure extends LoginState {
  LoginFailure({required LoginResponse loginResponse}) : super(loginResponse: loginResponse);
}

final class LoginError extends LoginState {
  LoginError({required String message}) : super(loginResponse: LoginResponse(status: null, message: message, userDetails:  null));
}

final class LoginLoading extends LoginState {
  LoginLoading() : super(loginResponse: LoginResponse(status: null, message: null, userDetails:  null));
}