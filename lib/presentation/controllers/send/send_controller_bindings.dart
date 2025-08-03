import 'package:get/instance_manager.dart';
import 'package:get_study/presentation/controllers/send/send_controller.dart';

class SendControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SendController());
  }
}