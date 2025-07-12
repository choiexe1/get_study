import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_study/features/home/presentation/controllers/home_controller.dart';
import 'package:get_study/features/home/presentation/widgets/credit_card.dart';

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
                      bankName: 'Korea Bank',
                      cardNumber: '123123123123123',
                      cvvCode: '123',
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
