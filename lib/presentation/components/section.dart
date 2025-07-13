import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Section extends StatelessWidget {
  const Section({
    required this.title,
    required this.children,
    super.key,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.spacing = 16,
  });

  final CrossAxisAlignment crossAxisAlignment;
  final double spacing;
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      spacing: spacing,
      children: [
        Text(title, style: ShadTheme.of(context).textTheme.h4),
        ...children,
      ],
    );
  }
}
