import 'package:get/get.dart';
import 'package:get_study/config/routes/app_routes.dart';
import 'package:get_study/features/home/bindings/home_bindings.dart';
import 'package:get_study/features/home/presentation/pages/home_page.dart';

class AppRoute {
  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
  ];
}
