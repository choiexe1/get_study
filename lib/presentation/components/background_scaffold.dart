import 'package:flutter/material.dart';

class BackgroundScaffold extends StatelessWidget {
  const BackgroundScaffold({
    required this.imageProvider,
    required this.child,
    super.key,
  });

  final ImageProvider imageProvider;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
      ),
      child: Scaffold(
        body: SafeArea(child: child),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
