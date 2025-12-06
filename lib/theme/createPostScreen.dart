import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lokee/models/postmodel.dart';
class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();

  File? selectedImage;

  Future pickImage(ImageSource source) async {
    try {
      final XFile? file = await ImagePicker().pickImage(source: source);

      if (file == null) return;

      setState(() => selectedImage = File(file.path));

    } catch (e) {
      print("IMAGE PICK ERROR: $e");
    }
  }

  void submitPost() {
    if (_textController.text.trim().isEmpty) return;

    final newPost = Post(
      text: _textController.text.trim(),
      tag: _tagController.text.trim().isEmpty ? null : _tagController.text.trim(),
      image: selectedImage,
      author: "Mary Johnson",
      createdAt: DateTime.now(),
    );

    Navigator.pop(context, newPost);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "Create Post",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: const [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("lib/images/Mary (2).jpg"),
                ),
                SizedBox(width: 10),
                Text("Mary Johnson",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),

            const SizedBox(height: 20),

            /// MAIN TEXT FIELD
            TextField(
              controller: _textController,
              maxLines: null,
              minLines: 5,
              decoration: InputDecoration(
                hintText: "Write something...",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),

            const SizedBox(height: 20),

            /// TAG INPUT (#)
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "#",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: TextField(
                    controller: _tagController,
                    decoration: InputDecoration(
                      hintText: "Add a tag...",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// IMAGE PREVIEW
            if (selectedImage != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.file(
                  selectedImage!,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

            const SizedBox(height: 20),

            /// PICK IMAGE BUTTONS
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => pickImage(ImageSource.gallery),
                    icon: const Icon(Icons.photo),
                    label: const Text("Gallery"),
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.purple)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => pickImage(ImageSource.camera),
                    icon: const Icon(Icons.camera_alt),
                    label: const Text("Camera"),
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.purple)),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 55,
          child: ElevatedButton(
            onPressed: submitPost,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text("Post",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
