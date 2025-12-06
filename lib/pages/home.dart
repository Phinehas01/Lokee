import 'package:flutter/material.dart';
import 'package:lokee/models/postmodel.dart';
import 'package:lokee/theme/createPostScreen.dart';
import 'package:lokee/theme/post_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Post> posts = [];

  Future openCreatePost() async {
    final Post? newPost = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CreatePostScreen()),
    );
    print(": $newPost");

    if (newPost != null) {
      setState(() => posts.insert(0, newPost));
      print("POST ADDED: ${newPost.text}");
    } else {
      print("POST CREATION CANCELLED");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70.0),
        child: FloatingActionButton(
        
          backgroundColor: Colors.purple,
          onPressed: openCreatePost,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),

      appBar: AppBar(
        title: const Text("Lokee",
            style: TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: 'Italic',
            )),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),

      body: posts.isEmpty
          ? const Center(
              child: Text("No posts yet. Create one!",
                  style: TextStyle(color: Colors.grey)),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(bottom: 100),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return PostWidget(post: posts[index]);
              },
            ),
    );
  }
}
