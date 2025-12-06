import 'dart:io';

class Post {
  final String text;
  final String? tag;
  final File? image;
  final String author;
  final DateTime createdAt;

  Post({
    required this.text,
    required this.author,
    this.tag,
    this.image,
    required this.createdAt,
  });
}
