import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_study/config/routes/app_routes.dart';
import 'package:get_study/core/base_exception.dart';
import 'package:get_study/core/result.dart';
import 'package:get_study/domain/use_cases/login_use_case.dart';
import 'package:get_study/domain/entities/user_entity.dart';
import 'package:get_study/presentation/controllers/login/login_event.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginController extends GetxController {
  LoginController(this._loginUseCase);

  final LoginUseCase _loginUseCase;

  final RxBool _obscure = true.obs;
  final Rx<LoginEvent> event = Rx(LoginEventInit());

  bool get obscure => _obscure.value;

  @override
  void onInit() {
    super.onInit();

    ever(event, (currentEvent) {
      switch (currentEvent) {
        case LoginEventInit():
        case LoginEventLoading():
          break;
        case LoginEventSuccess(:final user):
          Get.offNamed(Routes.goHome(user.id));
        case LoginEventFailed(:final String message):
          Get.dialog(
            Padding(
              padding: const EdgeInsets.all(32),
              child: ShadDialog.alert(
                title: const Text('로그인 실패'),
                description: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(message),
                ),
                actions: [
                  ShadButton(
                    child: const Text('확인'),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
            ),
          );
      }
    });
  }

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
        event.value = LoginEventSuccess(result.value);
      case Failure<UserEntity, BaseException>():
        event.value = LoginEventFailed(result.exception.message ?? '실패');
    }
  }
}
