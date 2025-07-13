import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_study/config/constants/storage_key.dart';
import 'package:get_study/config/routes/app_routes.dart';
import 'package:get_study/core/base_exception.dart';
import 'package:get_study/core/result.dart';
import 'package:get_study/domain/use_cases/login_use_case.dart';
import 'package:get_study/domain/entities/user_entity.dart';
import 'package:get_study/presentation/controllers/login/login_event.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginController extends GetxController {
  LoginController(this._storage, this._loginUseCase);

  final GetStorage _storage;
  final LoginUseCase _loginUseCase;

  final RxBool _obscure = true.obs;
  final RxString _loadedUsername = ''.obs;
  final Rx<LoginEvent> event = Rx(LoginEventInit());
  final RxBool _saveUsername = false.obs;

  bool get obscure => _obscure.value;
  bool get saveUsername => _saveUsername.value;
  String get loadedUsername => _loadedUsername.value;

  @override
  void onInit() {
    super.onInit();

    _saveUsername.value = _storage.read(StorageKey.saveUsername);
    final usrname = _storage.read(StorageKey.username);

    if (_saveUsername.value && usrname != null) {
      _loadedUsername.value = _storage.read(StorageKey.username);
    }

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
                title: const Text('알림'),
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

  void toggleSaveUsername() {
    _saveUsername.value = !_saveUsername.value;
    _storage.write(StorageKey.saveUsername, _saveUsername.value);

    if (_saveUsername.value == false) {
      _storage.remove(StorageKey.username);
    }
  }

  Future<void> login(String username, String password) async {
    event.value = LoginEventLoading();

    // TODO: 로그인 상태 변화 확인을 위한 딜레이
    await Future.delayed(Duration(seconds: 1));

    final Result<UserEntity, BaseException> result = await _loginUseCase((
      username: username,
      password: password,
    ));

    switch (result) {
      case Success<UserEntity, BaseException>():
        _storage.write(StorageKey.username, username);
        _storage.writeInMemory(StorageKey.currentUser, result.value);
        event.value = LoginEventSuccess(result.value);
      case Failure<UserEntity, BaseException>():
        event.value = LoginEventFailed(result.exception.message ?? '실패');
    }
  }
}
