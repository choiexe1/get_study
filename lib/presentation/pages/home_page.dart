import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_study/config/constants/image_constants.dart';
import 'package:get_study/presentation/components/crypto_asset.dart';
import 'package:get_study/presentation/components/section.dart';
import 'package:get_study/presentation/controllers/home/home_controller.dart';
import 'package:get_study/presentation/widgets/credit_card.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          backgroundColor: ShadTheme.of(context).colorScheme.primary,
          elevation: 0,
          strokeWidth: 1.5,
          color: ShadTheme.of(context).colorScheme.popover,
          onRefresh: () async => await controller.pullToRefresh(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                Center(
                  child: Obx(() {
                    return CreditCard(
                      holderName: controller.user.value.name,
                      canFlip: false,
                      bankName: '한국 은행'.tr,
                      cardNumber: '123123123123123',
                      cvvCode: '123',
                      labelValidThru: '유효기간'.tr,
                      expiryDate: '12/26',
                    );
                  }),
                ),
                Section(
                  title: '유저 정보',
                  children: [
                    Text(controller.user.value.id.toString()),
                    Text(controller.user.value.name),
                    Text(controller.user.value.username),
                  ],
                ),
                Section(
                  title: '보유 자산',
                  children: [
                    CryptoAsset(
                      symbol: 'BTC',
                      holdings: '12.95941733',
                      address: '0xc0ffee254729296a45a3885639AC7E10F9d54979',
                      child: SvgPicture.asset(ImageConstants.bitcoinLogo),
                    ),
                    CryptoAsset(
                      symbol: 'ETH',
                      holdings: '19.42817591',
                      child: SvgPicture.asset(ImageConstants.ethereumLogo),
                    ),
                    CryptoAsset(
                      symbol: 'TRX',
                      holdings: '491.491751',
                      address: '0x999999cf1046e68e36E1aA2E0E07105eDDD1f08E',
                      child: SvgPicture.asset(ImageConstants.tronTrxLogo),
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
