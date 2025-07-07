import 'package:get/instance_manager.dart';
import 'package:get_study/features/home/presentation/controllers/counter_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounterController());
  }
}
