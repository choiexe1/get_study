import 'package:get/route_manager.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'ko': {'GetX Example': 'GetX 예시 %s %s'},
    'en': {'GetX Example': 'GetX Example %s'},
  };
}
