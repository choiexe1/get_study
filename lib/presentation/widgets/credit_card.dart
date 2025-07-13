import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({
    required this.cardNumber,
    required this.expiryDate,
    required this.holderName,
    required this.cvvCode,
    required this.bankName,
    required this.canFlip,
    required this.labelValidThru,
    super.key,
  });

  final String cardNumber;
  final String expiryDate;
  final String holderName;
  final String cvvCode;
  final String bankName;
  final String labelValidThru;
  final bool canFlip;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: CreditCardWidget(
        textStyle: TextStyle(fontSize: 12, color: Colors.white),
        showBackView: false,
        onCreditCardWidgetChange: (CreditCardBrand brand) {},
        cardType: CardType.mastercard,
        isHolderNameVisible: true,
        isChipVisible: true,
        isSwipeGestureEnabled: canFlip,
        labelValidThru: labelValidThru,
        obscureCardNumber: true,
        obscureInitialCardNumber: false,
        obscureCardCvv: true,
        enableFloatingCard: true,
        cardNumber: cardNumber,
        expiryDate: expiryDate,
        cardHolderName: holderName,
        cvvCode: cvvCode,
        bankName: bankName,
      ),
    );
  }
}
