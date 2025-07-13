sealed class LoginEvent {}

class LoginEventInit extends LoginEvent {}

class LoginEventLoading extends LoginEvent {}

class LoginEventSuccess extends LoginEvent {}

class LoginEventFailed extends LoginEvent {
  LoginEventFailed(this.message);

  final String message;
}
