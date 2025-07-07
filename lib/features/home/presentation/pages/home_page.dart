import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_study/features/home/domain/view_model/counter_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterViewModel vm = Get.find<CounterViewModel>();

    return Scaffold(
      appBar: AppBar(title: Text('GetX Example'.trArgs(['ABC', 'DEF']))),
      body: Center(
        child: Row(
          children: [
            ElevatedButton(
              child: Text('Change Locale'.tr),
              onPressed: () {
                if (Get.locale?.languageCode == 'ko') {
                  Get.updateLocale(Locale('en'));
                } else {
                  Get.updateLocale(Locale('ko'));
                }
              },
            ),
            Obx(() => Text('${vm.counter}', style: TextStyle(fontSize: 48))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Hi'),
        onPressed: vm.increment,
      ),
    );
  }
}
