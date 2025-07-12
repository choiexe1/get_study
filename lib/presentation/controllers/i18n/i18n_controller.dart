import 'dart:ui';

import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/state_manager.dart';

class I18NController extends GetxController {
  I18NController() {
    if (Get.locale == null) {
      throw Exception('I18nViewModel을 사용하기 위해서 Get의 Locale을 먼저 설정하세요.');
    }
  }

  void changeLocale(Locale locale) {
    Get.updateLocale(locale);
  }

  Locale get locale => Get.locale!;
}
