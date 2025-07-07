import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_study/config/routes/app_pages.dart';
import 'package:get_study/config/routes/app_routes.dart';
import 'package:get_study/config/translation/app_translation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.home,
      locale: Locale('ko'),
      getPages: AppRoute.routes,
      translations: AppTranslation(),
      defaultTransition: Transition.cupertino,
    );
  }
}
