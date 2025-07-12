import 'package:get/route_manager.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'ko': {'한국 은행': '한국 은행', '유효기간': '유효기간'},
    'en': {'한국 은행': 'Korea Bank', '유효기간': 'Valid\nThru'},
  };
}
