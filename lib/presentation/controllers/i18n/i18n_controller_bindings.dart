import 'package:get/instance_manager.dart';
import 'package:get_study/presentation/controllers/i18n/i18n_controller.dart';

class I18NControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<I18NController>(() => I18NController());
  }
}
