import 'package:get/instance_manager.dart';
import 'package:get_study/features/auth/data/data_sources/remote_auth_data_source.dart';
import 'package:get_study/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:get_study/features/auth/domain/repositories/auth_repository.dart';

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
