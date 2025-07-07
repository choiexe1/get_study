import 'dart:ui';

import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/state_manager.dart';
import 'package:get_study/features/i18n/domain/view_model/i18n_view_model.dart';

class I18nViewModelImpl extends GetxController implements I18nViewModel {
  I18nViewModelImpl() {
    if (Get.locale == null) {
      throw Exception('I18nViewModel을 사용하기 위해서 Get의 Locale을 먼저 설정하세요.');
    }
  }

  @override
  void changeLocale(Locale locale) {
    Get.updateLocale(locale);
  }

  @override
  Locale get locale => Get.locale!;
}
