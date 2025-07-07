import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_study/features/home/domain/view_model/counter_view_model.dart';
import 'package:get_study/features/i18n/domain/view_model/i18n_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterViewModel vm = Get.find();
    final I18nViewModel i18n = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text('GetX Example'.trArgs(['ABC', 'DEF']))),
      body: Center(
        child: Row(
          children: [
            ElevatedButton(
              child: Text('Change Locale'.tr),
              onPressed: () {
                i18n.changeLocale(Locale('en'));
              },
            ),
            Obx(() => Text('${vm.counter}', style: TextStyle(fontSize: 48))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: vm.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
