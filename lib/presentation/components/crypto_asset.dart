import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CryptoAsset extends StatelessWidget {
  const CryptoAsset({
    required this.child,
    required this.symbol,
    required this.holdings,
    super.key,
    this.backgroundColor,
    this.address,
    this.radius = 20,
  });

  final Widget child;
  final double radius;
  final String symbol;
  final String holdings;
  final String? address;
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
            SizedBox(
              height: 20,
              child: ShadBadge(
                child: Text(
                  symbol,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.6,
                  ),
                ),
              ),
            ),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: holdings.substring(0, 8),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                  TextSpan(
                    text: address != null
                        ? ' (${address!.substring(0, 12)})'
                        : ' (Not connected)',
                    style: TextStyle(
                      color: Colors.black.withValues(alpha: 100),
                      fontSize: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
