import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_study/config/constants/storage_key.dart';
import 'package:get_study/domain/entities/user_entity.dart';

class HomeController extends GetxController {
  HomeController(this._storage);

  final GetStorage _storage;

  Rx<UserEntity> user = Rx(
    UserEntity(id: -1, name: '', password: '', username: ''),
  );

  @override
  void onInit() {
    user.value = _storage.read(StorageKey.currentUser);
    print(user.value);
    super.onInit();
  }
}
