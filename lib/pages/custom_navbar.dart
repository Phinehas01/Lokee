import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(
            index: 0,
            icon: Icons.home_outlined,
            label: "Home",
          ),
          _buildNavItem(
            index: 1,
            icon: Icons.chat_bubble_outline,
            label: "Chats",
          ),
          _buildNavItem(
            index: 2,
            icon: Icons.notifications_none,
            label: "Notifications",
          ),
          _buildNavItem(
            index: 3,
            icon: Icons.person_outline,
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final bool active = index == currentIndex;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: active ? 30 : 26,
            color: active ? Colors.white : Colors.white.withOpacity(0.45),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: active ? Colors.white : Colors.white.withOpacity(0.45),
              fontWeight: active ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
