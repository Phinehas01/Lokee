import 'package:flutter/material.dart';
import 'package:lokee/pages/feedslayout.dart';
import 'package:lokee/theme/createPostScreen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 70.0),
          child: FloatingActionButton(
          
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreatePostScreen()),
              );
            },
            backgroundColor: Colors.purple,
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "Lokee",
            style: TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: 'Italic',
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.black, size: 28),
                  SizedBox(width: 16),
                  Icon(Icons.add, color: Colors.black, size: 28),
                ],
              ),
            ),
          ],
        ),
        body: FeedsLayout(),
      ),
    );
  }
}
