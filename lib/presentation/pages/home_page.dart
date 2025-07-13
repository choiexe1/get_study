import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_study/config/constants/image_constants.dart';
import 'package:get_study/presentation/components/crypto_asset.dart';
import 'package:get_study/presentation/controllers/home/home_controller.dart';
import 'package:get_study/presentation/widgets/credit_card.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Center(
                child: Obx(
                  () => CreditCard(
                    holderName: controller.user.value.name,
                    canFlip: false,
                    bankName: '한국 은행'.tr,
                    cardNumber: '123123123123123',
                    cvvCode: '123',
                    labelValidThru: '유효기간'.tr,
                    expiryDate: '12/26',
                  ),
                ),
              ),
              CryptoAsset(
                symbol: 'BTC',
                holdings: '12.9594',
                child: SvgPicture.asset(ImageConstants.bitcoinLogo),
              ),
              CryptoAsset(
                symbol: 'ETH',
                holdings: '19.4281741023',
                child: SvgPicture.asset(ImageConstants.ethereumLogo),
              ),
              CryptoAsset(
                symbol: 'TRX',
                holdings: '491.491274103',
                child: SvgPicture.asset(ImageConstants.tronTrxLogo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
