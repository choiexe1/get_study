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
        Row(
          spacing: 8,
          children: [
            Text(title, style: ShadTheme.of(context).textTheme.h4),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: BoxBorder.fromLTRB(
                    top: BorderSide(
                      width: 0.2,
                      color: ShadTheme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        ...children,
      ],
    );
  }
}
