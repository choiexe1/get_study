import 'package:get/get.dart';
import 'package:get_study/config/routes/app_routes.dart';
import 'package:get_study/features/auth/bindings/login_bindings.dart';
import 'package:get_study/features/auth/presentation/pages/login_page.dart';
import 'package:get_study/features/home/bindings/home_bindings.dart';
import 'package:get_study/features/home/presentation/pages/home_page.dart';

class AppRouter {
  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.home,
      page: () {
        final int id = int.parse(Get.parameters['id']!);
        return HomePage(id: id);
      },
      bindings: [HomeControllerBindings()],
    ),
  ];
}
