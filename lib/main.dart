import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_study/config/routes/app_router.dart';
import 'package:get_study/config/routes/app_routes.dart';
import 'package:get_study/config/translation/app_translation.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final shadcnTheme = ShadThemeData(
      brightness: Brightness.dark,
      colorScheme: ShadColorScheme.fromName('stone'),
    );
    return GetMaterialApp(
      initialRoute: Routes.login,
      locale: const Locale('ko'),
      getPages: AppRouter.routes,
      translations: AppTranslation(),
      builder: (context, child) {
        return ShadTheme(data: shadcnTheme, child: child!);
      },
    );
  }
}
