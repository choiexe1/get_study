import 'package:get/state_manager.dart';
import 'package:get_study/data/data_sources/remote_auth_data_source.dart';
import 'package:get_study/domain/entities/user_entity.dart';

class HomeController extends GetxController {
  Rx<UserEntity> user = Rx(
    UserEntity(id: 0, name: '', password: '', username: ''),
  );

  @override
  void onInit() {
    user.value = users[0].toEntity();
    super.onInit();
  }
}
