import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CryptoAsset extends StatelessWidget {
  const CryptoAsset({
    required this.child,
    required this.symbol,
    required this.holdings,
    super.key,
    this.backgroundColor,
    this.radius = 20,
  });

  final Widget child;
  final double radius;
  final String symbol;
  final String holdings;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: backgroundColor ?? Colors.transparent,
          child: child,
        ),
        Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShadBadge(
              child: Text(
                symbol,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.6,
                ),
              ),
            ),
            Text(
              holdings,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black.withValues(alpha: 100),
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
