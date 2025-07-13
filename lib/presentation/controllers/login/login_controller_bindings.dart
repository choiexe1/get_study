import 'package:get/instance_manager.dart';
import 'package:get_study/domain/use_cases/login_use_case.dart';
import 'package:get_study/presentation/controllers/login/login_controller.dart';

class LoginControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginUseCase(Get.find()));
    Get.put(LoginController(Get.find(), Get.find()));
  }
}
