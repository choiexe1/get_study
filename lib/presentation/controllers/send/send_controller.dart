import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_study/presentation/controllers/send/send_state.dart';

class SendController extends GetxController {
  // Form controllers
  final addressController = TextEditingController();
  final amountController = TextEditingController();
  
  // State management
  final Rx<SendState> state = Rx(SendStateInit());
  
  // Observable text values for UI reactivity
  final RxString addressText = ''.obs;
  final RxString amountText = ''.obs;
  
  // Asset selection
  final RxString selectedAsset = 'BTC'.obs;
  final RxMap<String, Map<String, dynamic>> availableAssets = <String, Map<String, dynamic>>{
    'BTC': {
      'name': 'Bitcoin',
      'balance': '0.2847',
      'usdValue': 64752.33,
      'networkFee': 0.0001,
    },
    'ETH': {
      'name': 'Ethereum', 
      'balance': '4.2156',
      'usdValue': 3047.91,
      'networkFee': 0.002,
    },
    'TRX': {
      'name': 'Tron',
      'balance': '15842.33',
      'usdValue': 0.162,
      'networkFee': 1.0,
    },
  }.obs;
  
  // Amount and fee calculation
  final RxDouble networkFee = 0.0001.obs;
  final RxString usdAmount = ''.obs;
  
  // Form validation
  final RxBool isAddressValid = false.obs;
  final RxBool isAmountValid = false.obs;
  final RxBool isFormValid = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    _setupListeners();
    _updateNetworkFee();
  }
  
  @override
  void onClose() {
    addressController.dispose();
    amountController.dispose();
    super.onClose();
  }
  
  void _setupListeners() {
    // Address validation
    addressController.addListener(() {
      addressText.value = addressController.text;
      isAddressValid.value = _validateAddress(addressController.text);
      _updateFormValidity();
    });
    
    // Amount validation and USD calculation
    amountController.addListener(() {
      amountText.value = amountController.text;
      isAmountValid.value = _validateAmount(amountController.text);
      _calculateUsdAmount();
      _updateFormValidity();
    });
    
    // Asset selection listener
    selectedAsset.listen((_) {
      _updateNetworkFee();
      _calculateUsdAmount();
    });
  }
  
  bool _validateAddress(String address) {
    if (address.isEmpty) return false;
    
    // Basic validation - in real app would use proper crypto address validation
    switch (selectedAsset.value) {
      case 'BTC':
        return address.length >= 26 && address.length <= 35;
      case 'ETH':
        return address.length == 42 && address.startsWith('0x');
      case 'TRX':
        return address.length == 34 && address.startsWith('T');
      default:
        return false;
    }
  }
  
  bool _validateAmount(String amount) {
    if (amount.isEmpty) return false;
    
    final double? value = double.tryParse(amount);
    if (value == null || value <= 0) return false;
    
    final double balance = double.tryParse(
      availableAssets[selectedAsset.value]?['balance'] ?? '0'
    ) ?? 0;
    
    return value <= balance;
  }
  
  void _updateFormValidity() {
    isFormValid.value = isAddressValid.value && isAmountValid.value;
  }
  
  void _updateNetworkFee() {
    networkFee.value = availableAssets[selectedAsset.value]?['networkFee'] ?? 0.0;
  }
  
  void _calculateUsdAmount() {
    final amount = double.tryParse(amountController.text) ?? 0;
    final usdValue = availableAssets[selectedAsset.value]?['usdValue'] ?? 0.0;
    final totalUsd = amount * usdValue;
    usdAmount.value = totalUsd > 0 ? '\$${totalUsd.toStringAsFixed(2)}' : '';
  }
  
  void selectAsset(String asset) {
    selectedAsset.value = asset;
    // Clear amount when changing asset
    amountController.clear();
  }
  
  void setMaxAmount() {
    final balance = availableAssets[selectedAsset.value]?['balance'] ?? '0';
    final maxAmount = double.tryParse(balance) ?? 0;
    final fee = networkFee.value;
    
    // For crypto, subtract network fee from max amount
    final availableAmount = maxAmount - fee;
    if (availableAmount > 0) {
      amountController.text = availableAmount.toStringAsFixed(8);
    }
  }
  
  Future<void> sendTransaction() async {
    if (!isFormValid.value) return;
    
    try {
      state.value = SendStateLoading();
      
      // Simulate transaction processing
      await Future.delayed(const Duration(seconds: 2));
      
      // Simulate random success/failure for demo
      final success = DateTime.now().millisecondsSinceEpoch % 2 == 0;
      
      if (success) {
        // Generate fake transaction hash
        final txHash = '0x${DateTime.now().millisecondsSinceEpoch.toRadixString(16)}';
        state.value = SendStateSuccess(txHash);
        
        // Clear form after successful send
        _clearForm();
      } else {
        state.value = SendStateError('Transaction failed. Please try again.');
      }
    } catch (e) {
      state.value = SendStateError('An error occurred: ${e.toString()}');
    }
  }
  
  void _clearForm() {
    addressController.clear();
    amountController.clear();
    addressText.value = '';
    amountText.value = '';
  }
  
  void resetState() {
    state.value = SendStateInit();
  }
  
  // Getters for UI
  Map<String, dynamic>? get currentAssetInfo => availableAssets[selectedAsset.value];
  String get currentAssetName => currentAssetInfo?['name'] ?? '';
  String get currentAssetBalance => currentAssetInfo?['balance'] ?? '0';
  double get networkFeeUsd => networkFee.value * (currentAssetInfo?['usdValue'] ?? 0.0);
}