import 'package:get/instance_manager.dart';
import 'package:get_study/features/i18n/domain/view_model/i18n_view_model.dart';
import 'package:get_study/features/i18n/presentation/view_model/i18n_view_model_impl.dart';

class I18nBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<I18nViewModel>(() => I18nViewModelImpl());
  }
}
