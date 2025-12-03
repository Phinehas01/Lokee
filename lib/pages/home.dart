import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        body: buildBody(),
      ),
      
    );
  }
  Widget buildBody() {
    return Container(
      child: Column(
        children: [
           Text(
              "Home Screen",
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
          
        ],
      ),
    );
  }
}
