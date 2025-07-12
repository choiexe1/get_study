import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_study/config/routes/app_routes.dart';
import 'package:get_study/features/auth/presentation/controllers/login_controller.dart';
import 'package:get_study/features/auth/presentation/controllers/login_event.dart';
import 'package:get_study/features/widgets/background_scaffold.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final Worker worker;
  final loginController = Get.find<LoginController>();
  final formKey = GlobalKey<ShadFormState>();

  @override
  void initState() {
    super.initState();

    worker = ever(loginController.event, (event) {
      switch (event) {
        case LoginEventSuccess(:final user):
          Get.offNamed(Routes.goHome(user.id));
        case LoginEventFailed(:final String message):
          showShadDialog(
            context: context,
            builder: (context) => _buildAlertDialog(message),
          );
        case LoginEventInit():
          break;
        case LoginEventLoading():
          break;
      }
    });
  }

  @override
  void dispose() {
    worker.dispose();
    super.dispose();
  }

  Widget _buildAlertDialog(String message) {
    return ShadDialog.alert(
      title: const Text('알림'),
      description: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(message),
      ),
      actions: [
        ShadButton(
          child: const Text('확인'),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      child: Center(
        child: ShadForm(
          key: formKey,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ShadInputFormField(
                  decoration: ShadDecoration(color: Colors.white),
                  id: 'username',
                  label: const Text('Username'),
                  placeholder: const Text('유저네임을 입력하세요.'),
                  validator: (v) {
                    if (v.length < 2) {
                      return '유저네임은 최소 2글자 이상이어야 합니다.';
                    }
                    return null;
                  },
                ),
                Obx(
                  () => ShadInputFormField(
                    decoration: ShadDecoration(color: Colors.white),
                    id: 'password',
                    placeholder: const Text('비밀번호'),
                    obscureText: loginController.obscure,
                    leading: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(LucideIcons.lock),
                    ),
                    trailing: ShadButton(
                      width: 24,
                      height: 24,
                      padding: EdgeInsets.zero,
                      leading: Icon(
                        loginController.obscure
                            ? LucideIcons.eyeOff
                            : LucideIcons.eye,
                      ),
                      onPressed: () => loginController.toggleObscure(),
                    ),
                    validator: (v) {
                      if (v.length < 2) {
                        return '패스워드는 최소 2글자 이상이어야 합니다.';
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  children: [
                    ShadButton(
                      child: const Text('로그인'),
                      onPressed: () async {
                        final validated = formKey.currentState!
                            .saveAndValidate();

                        if (validated) {
                          final username =
                              formKey.currentState!.value['username'];
                          final password =
                              formKey.currentState!.value['password'];

                          await loginController.login(username, password);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
