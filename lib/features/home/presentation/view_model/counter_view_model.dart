import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_study/features/home/domain/view_model/counter_view_model.dart';

class CounterViewModelImpl extends GetxController implements CounterViewModel {
  RxInt count = 0.obs;

  @override
  int get counter => count.value;

  @override
  void decrement() => count--;

  @override
  void increment() => count++;
}
