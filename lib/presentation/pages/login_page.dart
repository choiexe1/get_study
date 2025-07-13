import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_study/config/constants/image_constants.dart';
import 'package:get_study/presentation/controllers/login/login_controller.dart';
import 'package:get_study/presentation/components/background_scaffold.dart';
import 'package:get_study/presentation/controllers/login/login_event.dart';
import 'package:get_study/presentation/widgets/leading_button.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<ShadFormState>();

    return BackgroundScaffold(
      imageProvider: AssetImage(ImageConstants.bg1),
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
                Obx(
                  () => ShadInputFormField(
                    decoration: ShadDecoration(color: Colors.white),
                    id: 'username',
                    label: const Text('Username'),
                    initialValue: controller.loadedUsername,
                    placeholder: const Text('유저네임을 입력하세요.'),
                    validator: (v) {
                      if (v.length < 2) {
                        return '유저네임은 최소 2글자 이상이어야 합니다.';
                      }
                      return null;
                    },
                  ),
                ),
                Obx(
                  () => ShadInputFormField(
                    decoration: ShadDecoration(color: Colors.white),
                    id: 'password',
                    placeholder: const Text('비밀번호'),
                    obscureText: controller.obscure,
                    leading: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(LucideIcons.lock),
                    ),
                    trailing: ShadButton(
                      width: 24,
                      height: 24,
                      padding: EdgeInsets.zero,
                      leading: Icon(
                        controller.obscure
                            ? LucideIcons.eyeOff
                            : LucideIcons.eye,
                      ),
                      onPressed: () => controller.toggleObscure(),
                    ),
                    validator: (v) {
                      if (v.length < 2) {
                        return '비밀번호는 최소 2글자 이상이어야 합니다.';
                      }
                      return null;
                    },
                  ),
                ),
                Obx(
                  () => ShadCheckbox(
                    value: controller.saveUsername,
                    onChanged: (v) => controller.toggleSaveUsername(),
                    label: const Text(
                      '유저네임 저장',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => LeadingButton(
                        onPressed: () {
                          final validated = formKey.currentState!
                              .saveAndValidate();

                          if (validated) {
                            final username =
                                formKey.currentState!.value['username'];
                            final password =
                                formKey.currentState!.value['password'];
                            controller.login(username, password);
                          }
                        },
                        spacing: 12,
                        children: [
                          controller.event.value is LoginEventLoading
                              ? SizedBox.square(
                                  dimension: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: ShadTheme.of(
                                      context,
                                    ).colorScheme.primaryForeground,
                                  ),
                                )
                              : const Icon(Icons.login, size: 16),
                          const Text('로그인'),
                        ],
                      ),
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
