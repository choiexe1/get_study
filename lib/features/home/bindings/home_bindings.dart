import 'package:get/instance_manager.dart';
import 'package:get_study/features/home/presentation/controllers/home_controller.dart';

class HomeControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
