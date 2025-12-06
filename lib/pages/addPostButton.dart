import 'package:flutter/material.dart';

class AddPostButton extends StatelessWidget {
  final VoidCallback onTap;
  final double size;
  final Color color;
  final Color iconColor;

  const AddPostButton({
    super.key,
    required this.onTap,
    this.size = 60,
    this.color = Colors.purple,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(size / 2),
          onTap: onTap,
          child: Icon(
            Icons.add,
            size: size * 0.45,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
