import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Chats",
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'Italic',
          ),
        ),
      ),
    );
  }
}
