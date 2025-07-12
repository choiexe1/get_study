import 'package:flutter/material.dart';

class BackgroundScaffold extends StatelessWidget {
  const BackgroundScaffold({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg-1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        body: SafeArea(child: child),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
