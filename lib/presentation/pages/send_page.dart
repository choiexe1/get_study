import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_study/config/constants/image_constants.dart';
import 'package:get_study/presentation/controllers/send/send_controller.dart';
import 'package:get_study/presentation/controllers/send/send_state.dart';

class SendPage extends GetView<SendController> {
  const SendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Send',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        final state = controller.state.value;
        
        if (state is SendStateSuccess) {
          return _buildSuccessView(context, state.transactionHash);
        }
        
        return _buildSendForm(context);
      }),
    );
  }

  Widget _buildSendForm(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildRecipientSection(context),
          const SizedBox(height: 24),
          _buildAssetSelectionSection(context),
          const SizedBox(height: 24),
          _buildAmountSection(context),
          const SizedBox(height: 24),
          _buildNetworkFeeSection(context),
          const SizedBox(height: 32),
          _buildSendButton(context),
        ],
      ),
    );
  }

  Widget _buildRecipientSection(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recipient Address',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: theme.textTheme.bodyLarge?.color,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: theme.dividerColor.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller.addressController,
                  decoration: const InputDecoration(
                    hintText: 'Enter recipient address',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 8),
                child: IconButton(
                  onPressed: () {
                    // QR scan functionality
                    Get.snackbar(
                      'QR Scanner',
                      'QR scanning not implemented in this demo',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  icon: Icon(
                    Icons.qr_code_scanner,
                    color: theme.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Obx(() => controller.addressText.value.isNotEmpty && !controller.isAddressValid.value
          ? Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Invalid address format',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            )
          : const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildAssetSelectionSection(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Asset',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: theme.textTheme.bodyLarge?.color,
          ),
        ),
        const SizedBox(height: 12),
        Obx(() => Column(
          children: controller.availableAssets.entries.map((entry) {
            final assetKey = entry.key;
            final assetData = entry.value;
            final isSelected = controller.selectedAsset.value == assetKey;
            
            return _buildAssetCard(
              context,
              assetKey,
              assetData['name'],
              assetData['balance'],
              _getAssetIcon(assetKey),
              isSelected,
              () => controller.selectAsset(assetKey),
            );
          }).toList(),
        )),
      ],
    );
  }

  Widget _buildAssetCard(
    BuildContext context,
    String symbol,
    String name,
    String balance,
    Widget icon,
    bool isSelected,
    VoidCallback onTap,
  ) {
    final theme = Theme.of(context);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected 
                ? theme.primaryColor.withValues(alpha: 0.1)
                : theme.cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected 
                  ? theme.primaryColor
                  : theme.dividerColor.withValues(alpha: 0.2),
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: icon,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        symbol,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 12,
                          color: theme.textTheme.bodySmall?.color,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      balance,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Available',
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.textTheme.bodySmall?.color,
                      ),
                    ),
                  ],
                ),
                if (isSelected) ...[
                  const SizedBox(width: 8),
                  Icon(
                    Icons.check_circle,
                    color: theme.primaryColor,
                    size: 20,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAmountSection(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Amount',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: theme.textTheme.bodyLarge?.color,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: theme.dividerColor.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.amountController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        hintText: '0.00',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 12),
                    child: TextButton(
                      onPressed: controller.setMaxAmount,
                      child: Text(
                        'MAX',
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Obx(() => controller.usdAmount.value.isNotEmpty
                ? Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
                    child: Text(
                      controller.usdAmount.value,
                      style: TextStyle(
                        fontSize: 14,
                        color: theme.textTheme.bodySmall?.color,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
        Obx(() => controller.amountText.value.isNotEmpty && !controller.isAmountValid.value
          ? Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Insufficient balance',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            )
          : const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildNetworkFeeSection(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.dividerColor.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Network Fee',
            style: TextStyle(
              fontSize: 14,
              color: theme.textTheme.bodySmall?.color,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${controller.networkFee.value} ${controller.selectedAsset.value}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '\$${controller.networkFeeUsd.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 12,
                  color: theme.textTheme.bodySmall?.color,
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }

  Widget _buildSendButton(BuildContext context) {
    final theme = Theme.of(context);
    
    return Obx(() {
      final state = controller.state.value;
      final isLoading = state is SendStateLoading;
      final isFormValid = controller.isFormValid.value;
      
      return SizedBox(
        height: 56,
        child: ElevatedButton(
          onPressed: isFormValid && !isLoading ? controller.sendTransaction : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
          child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : const Text(
                'Send',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
        ),
      );
    });
  }

  Widget _buildSuccessView(BuildContext context, String transactionHash) {
    final theme = Theme.of(context);
    
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(40),
              ),
              child: const Icon(
                Icons.check_circle,
                size: 48,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Transaction Sent!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Your transaction has been successfully submitted to the network.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: theme.textTheme.bodySmall?.color,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: theme.dividerColor.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Transaction Hash',
                    style: TextStyle(
                      fontSize: 14,
                      color: theme.textTheme.bodySmall?.color,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    transactionHash,
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  controller.resetState();
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getAssetIcon(String symbol) {
    switch (symbol) {
      case 'BTC':
        return SvgPicture.asset(
          ImageConstants.bitcoinLogo,
          fit: BoxFit.contain,
        );
      case 'ETH':
        return SvgPicture.asset(
          ImageConstants.ethereumLogo,
          fit: BoxFit.contain,
        );
      case 'TRX':
        return SvgPicture.asset(
          ImageConstants.tronTrxLogo,
          fit: BoxFit.contain,
        );
      default:
        return const Icon(Icons.currency_bitcoin);
    }
  }
}