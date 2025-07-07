import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_study/features/home/presentation/controllers/counter_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController controller = Get.find<CounterController>();

    return Scaffold(
      appBar: AppBar(title: Text('GetX Example'.trArgs(['ABC', 'DEF']))),
      body: Center(
        child: Obx(
          () => Row(
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
              Text('${controller.count.value}', style: TextStyle(fontSize: 48)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
