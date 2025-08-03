import 'package:flutter/material.dart';
import 'package:get_study/presentation/widgets/quick_action_button.dart';

class QuickActionGrid extends StatelessWidget {
  const QuickActionGrid({
    required this.actionButtons,
    super.key,
    this.crossAxisCount = 4,
    this.spacing = 12.0,
    this.padding = const EdgeInsets.all(20),
  });

  final List<QuickActionButton> actionButtons;
  final int crossAxisCount;
  final double spacing;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding,
      child: Row(
        children: actionButtons.asMap().entries.map((entry) {
          final index = entry.key;
          final action = entry.value;

          return Expanded(
            child: Container(
              margin: EdgeInsets.only(
                right: index < actionButtons.length - 1 ? spacing : 0,
              ),
              child: action,
            ),
          );
        }).toList(),
      ),
    );
  }
}
