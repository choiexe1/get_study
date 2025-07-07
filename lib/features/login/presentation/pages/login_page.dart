import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:get_study/config/routes/app_routes.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscure = true;
  final formKey = GlobalKey<ShadFormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                  id: 'username',
                  label: const Text('Username'),
                  placeholder: const Text('Enter your username'),
                  validator: (v) {
                    if (v.length < 2) {
                      return 'Username must be at least 2 characters.';
                    }
                    return null;
                  },
                ),
                ShadInputFormField(
                  id: 'password',
                  placeholder: const Text('Password'),
                  obscureText: obscure,
                  leading: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(LucideIcons.lock),
                  ),
                  trailing: ShadButton(
                    width: 24,
                    height: 24,
                    padding: EdgeInsets.zero,
                    leading: Icon(
                      obscure ? LucideIcons.eyeOff : LucideIcons.eye,
                    ),
                    onPressed: () {
                      setState(() => obscure = !obscure);
                    },
                  ),
                  validator: (v) {
                    if (v.length < 2) {
                      return 'Password must be at least 2 characters.';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    ShadButton(
                      child: const Text('Submit'),
                      onPressed: () {
                        final validated = formKey.currentState!
                            .saveAndValidate();

                        if (validated) {
                          final username =
                              formKey.currentState!.value['username'];
                          final password =
                              formKey.currentState!.value['password'];

                          if (username == 'jay' && password == 'jay') {
                            Get.offAndToNamed(Routes.home);
                          }
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
