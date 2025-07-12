import 'package:get/state_manager.dart';
import 'package:get_study/core/base_exception.dart';
import 'package:get_study/core/result.dart';
import 'package:get_study/features/auth/domain/entities/user_entity.dart';
import 'package:get_study/features/auth/domain/use_cases/login_use_case.dart';
import 'package:get_study/features/auth/presentation/controllers/login_event.dart';

class LoginController extends GetxController {
  LoginController(this._loginUseCase);

  final LoginUseCase _loginUseCase;

  final RxBool _obscure = true.obs;
  final Rx<LoginEvent> event = Rx(LoginEventInit());

  bool get obscure => _obscure.value;

  void toggleObscure() {
    _obscure.value = !_obscure.value;
  }

  Future<void> login(String username, String password) async {
    final Result<UserEntity, BaseException> result = await _loginUseCase((
      username: username,
      password: password,
    ));

    switch (result) {
      case Success<UserEntity, BaseException>():
        event.value = LoginEventSuccess();
      case Failure<UserEntity, BaseException>():
        event.value = LoginEventFailed(result.exception.message ?? '실패');
    }
  }
}
