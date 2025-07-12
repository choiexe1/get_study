import 'package:get/get.dart';
import 'package:get_study/config/routes/app_routes.dart';
import 'package:get_study/presentation/controllers/home/home_controller_bindings.dart';
import 'package:get_study/presentation/controllers/login/login_controller_bindings.dart';
import 'package:get_study/presentation/pages/login_page.dart';
import 'package:get_study/presentation/pages/home_page.dart';

class AppRouter {
  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginControllerBindings(),
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
