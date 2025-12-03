import 'package:flutter/material.dart';

class AppGradients {
  static const LinearGradient vibeGradient = LinearGradient(
    begin: Alignment.bottomRight,     // Glow starts bottom-left
    end: Alignment.topLeft,         // Fade out direction
    stops: [0.0, 0.9, 1.0],          // Purple 90%, Pink 10%
    colors: [
      Color(0xFFC4578B),            // Pink at last 10%
      Color.fromARGB(255, 72, 38, 106),            // Purple (dominates 90%)
      Color.fromARGB(255, 53, 30, 75),            // Hold purple until 90%
    ],
  );

  static const BoxDecoration backgroundDecoration = BoxDecoration(
    gradient: vibeGradient,
  );
}
