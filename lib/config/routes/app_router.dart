import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_study/config/routes/app_routes.dart';
import 'package:get_study/presentation/components/scaffolds/search_bar_scaffold.dart';
import 'package:get_study/presentation/controllers/home/home_controller_bindings.dart';
import 'package:get_study/presentation/controllers/login/login_controller_bindings.dart';
import 'package:get_study/presentation/controllers/send/send_controller_bindings.dart';
import 'package:get_study/presentation/pages/login_page.dart';
import 'package:get_study/presentation/pages/send_page.dart';
import 'package:get_study/presentation/pages/wallet_home_page.dart';

class AppRouter {
  static final routes = [
    GetPage(
      name: '/component',
      page: () {
        return SearchBarScaffold(
          controller: TextEditingController(),
          placeHolder: '검색하세요.',
          onSearchSubmitted: (String value) {
            debugPrint(value);
          },
        );
      },
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginControllerBindings(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const WalletHomePage(),
      binding: HomeControllerBindings(),
    ),
    GetPage(
      name: Routes.send,
      page: () => const SendPage(),
      binding: SendControllerBindings(),
    ),
  ];
}
