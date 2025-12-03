import 'package:flutter/material.dart';
import 'package:lokee/pages/custom_navbar.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  final int currentIndex;
  final Function(int) onTab;

  const BaseScreen({
    super.key,
    required this.child,
    required this.currentIndex,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(child: child),
      bottomNavigationBar: CustomNavbar(
        currentIndex: currentIndex,
        onTap: onTab,
      ),
    );
  }
}
