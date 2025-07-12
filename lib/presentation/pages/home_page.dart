import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_study/presentation/controllers/home/home_controller.dart';
import 'package:get_study/presentation/widgets/credit_card.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          spacing: 10,
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Obx(
                    () => CreditCard(
                      holderName: controller.user.value.name,
                      canFlip: false,
                      bankName: '한국 은행'.tr,
                      cardNumber: '123123123123123',
                      cvvCode: '123',
                      labelValidThru: '유효기간'.tr,
                      expiryDate: '12/26',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
