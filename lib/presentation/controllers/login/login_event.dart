import 'package:get_study/domain/entities/user_entity.dart';

sealed class LoginEvent {}

class LoginEventInit extends LoginEvent {}

class LoginEventLoading extends LoginEvent {}

class LoginEventSuccess extends LoginEvent {
  LoginEventSuccess(this.user);

  final UserEntity user;
}

class LoginEventFailed extends LoginEvent {
  LoginEventFailed(this.message);

  final String message;
}
