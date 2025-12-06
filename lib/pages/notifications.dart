import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Notifications",
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: const [
            NotificationCard(
              avatarPath: 'lib/images/Mary3.jpg',
              title: 'Annette',
              message: 'liked your post',
              time: '2 min ago',
            ),
            SizedBox(height: 14),

            NotificationCard(
              avatarPath: 'lib/images/Mary2.jpg',
              title: 'Ethan',
              message: 'commented: 😍',
              time: '10 min ago',
            ),
            SizedBox(height: 14),

            NotificationCard.icon(
              icon: Icons.favorite,
              iconBackground: Colors.purple,
              title: '30 people',
              message: 'liked your photo',
              time: '1 hour ago',
            ),
            SizedBox(height: 14),

            NotificationCard(
              avatarPath: 'lib/images/Mary3.jpg',
              title: 'New follower',
              message: 'Emma',
              time: '2 hours ago',
            ),
            SizedBox(height: 14),

            NotificationCard(
              avatarPath: 'lib/images/Mary4.jpg',
              title: 'David mentioned you',
              message: 'in a comment',
              time: '4 hours ago',
            ),

            SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}


/// Notification Card
class NotificationCard extends StatelessWidget {
  final String? avatarPath;
  final IconData? icon;
  final Color? iconBackground;
  final String title;
  final String message;
  final String time;

  const NotificationCard({
    super.key,
    this.avatarPath,
    this.icon,
    this.iconBackground,
    required this.title,
    required this.message,
    required this.time,
  }) : assert((avatarPath != null) ^ (icon != null),
              'Provide either avatarPath or icon (not both)');

  const NotificationCard.icon({
    super.key,
    this.avatarPath,
    required this.icon,
    this.iconBackground,
    required this.title,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          )
        ],
      ),

      child: Row(
        children: [
          if (avatarPath != null)
            CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage(avatarPath!),
            )
          else
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: iconBackground ?? Colors.purple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.white, size: 28),
            ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          Text(
            time,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
