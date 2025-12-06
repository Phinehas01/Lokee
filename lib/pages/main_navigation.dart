import 'package:flutter/material.dart';
import 'custom_navbar.dart';

import 'home.dart';
import 'notifications.dart';
import 'chats.dart';
import 'profileScreen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    ChatScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // allows rounded navbar background
      body: pages[currentIndex],

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(179, 40, 4, 24),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        child: CustomNavbar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
