import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Search",
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
