import 'package:flutter/material.dart';
import 'package:get_study/presentation/widgets/quick_action.dart';
import 'package:get_study/presentation/widgets/quick_action_button.dart';

class QuickActionGrid extends StatelessWidget {
  const QuickActionGrid({
    required this.actions,
    super.key,
    this.crossAxisCount = 4,
    this.spacing = 12.0,
    this.padding = const EdgeInsets.all(20),
  });

  final List<QuickAction> actions;
  final int crossAxisCount;
  final double spacing;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding,
      child: Row(
        children: actions.asMap().entries.map((entry) {
          final index = entry.key;
          final action = entry.value;

          return Expanded(
            child: Container(
              margin: EdgeInsets.only(
                right: index < actions.length - 1 ? spacing : 0,
              ),
              child: QuickActionButton(action: action),
            ),
          );
        }).toList(),
      ),
    );
  }
}
