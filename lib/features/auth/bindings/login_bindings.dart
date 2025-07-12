import 'package:get/instance_manager.dart';
import 'package:get_study/features/auth/domain/use_cases/login_use_case.dart';
import 'package:get_study/features/auth/presentation/controllers/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginUseCase(Get.find()));
    Get.put(LoginController(Get.find()));
  }
}
