import 'package:get/get.dart';
import 'package:get_study/config/routes/app_routes.dart';
import 'package:get_study/features/home/bindings/home_bindings.dart';
import 'package:get_study/features/home/presentation/pages/home_page.dart';
import 'package:get_study/features/i18n/bindings/i18n_bindings.dart';

class AppRoute {
  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      bindings: [HomeBindings(), I18nBindings()],
    ),
  ];
}
