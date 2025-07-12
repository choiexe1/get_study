import 'package:get/get.dart';
import 'package:get_study/config/routes/app_routes.dart';
import 'package:get_study/features/auth/bindings/login_bindings.dart';
import 'package:get_study/features/auth/presentation/pages/login_page.dart';
import 'package:get_study/features/home/bindings/home_bindings.dart';
import 'package:get_study/features/home/presentation/pages/home_page.dart';
import 'package:get_study/features/i18n/bindings/i18n_bindings.dart';

class AppRouter {
  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      bindings: [HomeBindings(), I18nBindings()],
    ),
  ];
}
