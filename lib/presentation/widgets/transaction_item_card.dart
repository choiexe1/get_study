import 'package:flutter/material.dart';

enum TransactionType { sent, received, swapped, bought, sold }

class TransactionItemCard extends StatelessWidget {
  const TransactionItemCard({
    required this.type,
    required this.asset,
    required this.amount,
    required this.time,
    super.key,
    this.isPositive = true,
    this.value,
    this.onTap,
    this.margin = const EdgeInsets.only(bottom: 12),
  });

  final TransactionType type;
  final String asset;
  final String amount;
  final String time;
  final bool isPositive;
  final String? value;
  final VoidCallback? onTap;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      margin: margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(16),
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
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: (isPositive ? Colors.green : Colors.red).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    _getTransactionIcon(),
                    size: 20,
                    color: isPositive ? Colors.green : Colors.red,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getTransactionTitle(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        asset,
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
                      amount,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isPositive ? Colors.green : Colors.red,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.textTheme.bodySmall?.color,
                      ),
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

  IconData _getTransactionIcon() {
    switch (type) {
      case TransactionType.sent:
        return Icons.arrow_upward;
      case TransactionType.received:
        return Icons.arrow_downward;
      case TransactionType.swapped:
        return Icons.swap_horiz;
      case TransactionType.bought:
        return Icons.add;
      case TransactionType.sold:
        return Icons.remove;
    }
  }

  String _getTransactionTitle() {
    switch (type) {
      case TransactionType.sent:
        return 'Sent';
      case TransactionType.received:
        return 'Received';
      case TransactionType.swapped:
        return 'Swapped';
      case TransactionType.bought:
        return 'Bought';
      case TransactionType.sold:
        return 'Sold';
    }
  }
}