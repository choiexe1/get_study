import 'package:get/instance_manager.dart';
import 'package:get_study/features/home/domain/view_model/counter_view_model.dart';
import 'package:get_study/features/home/presentation/view_model/counter_view_model.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CounterViewModel>(() => CounterViewModelImpl());
  }
}
