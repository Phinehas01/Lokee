import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lokee/models/postmodel.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// USER + DATE
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("lib/images/M1.png"),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.author,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    "${post.createdAt.hour}:${post.createdAt.minute.toString().padLeft(2, '0')}",
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// TEXT CONTENT
          Text(post.text, style: const TextStyle(fontSize: 16)),

          if (post.tag != null) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text("#${post.tag}",
                  style: const TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.bold)),
            ),
          ],

          const SizedBox(height: 12),

          /// IMAGE (if exists)
          if (post.image != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.file(
                File(post.image!.path),
                height: 240,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }
}
