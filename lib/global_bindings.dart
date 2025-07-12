import 'package:get/instance_manager.dart';
import 'package:get_study/data/data_sources/remote_auth_data_source.dart';
import 'package:get_study/data/repositories/auth_repository_impl.dart';
import 'package:get_study/domain/repositories/auth_repository.dart';

class GlobalBindings extends Bindings {
  void initDataSources() {
    Get.lazyPut(() => RemoteAuthDataSource());
  }

  void initRepositories() {
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find()));
  }

  @override
  void dependencies() {
    initDataSources();
    initRepositories();
  }
}
