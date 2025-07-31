import 'package:flutter/foundation.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_study/config/constants/storage_key.dart';
import 'package:get_study/domain/entities/user_entity.dart';
import 'package:get_study/presentation/controllers/home/home_state.dart';

class HomeController extends GetxController {
  HomeController(this._storage);

  Rx<HomeState> state = Rx(HomeStateInit());
  final GetStorage _storage;

  Rx<UserEntity> user = Rx(
    UserEntity(id: -1, name: '', password: '', username: ''),
  );

  @override
  void onInit() {
    user.value = _storage.read(StorageKey.currentUser);
    super.onInit();
  }

  Future<void> pullToRefresh() async {
    state.value = HomeStateLoading();
    await Future.delayed(Duration(seconds: 1));
    debugPrint('refresh');
    state.value = HomeStateInit();
  }
}
