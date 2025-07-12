import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LeadingButton extends StatelessWidget {
  const LeadingButton({
    required this.children,
    required this.onPressed,
    this.spacing = 0,
    super.key,
  });

  final VoidCallback onPressed;
  final List<Widget> children;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return ShadButton(
      onPressed: onPressed,
      child: Row(
        spacing: spacing,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
