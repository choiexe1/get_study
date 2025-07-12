import 'package:get/instance_manager.dart';
import 'package:get_study/presentation/controllers/home/home_controller.dart';

class HomeControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
