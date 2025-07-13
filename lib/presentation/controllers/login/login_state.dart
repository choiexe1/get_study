sealed class LoginState {}

class LoginStateInit extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateSuccess extends LoginState {}

class LoginStateFailed extends LoginState {
  LoginStateFailed(this.message);

  final String message;
}
