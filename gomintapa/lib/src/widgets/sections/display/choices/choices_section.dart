import 'package:flutter/material.dart';
import 'package:gomintapa/src/widgets/sections/display/choices/photo_display.dart';

import 'text_display.dart';

class ChoicesSection extends StatelessWidget {
  final String choiceText;
  final String imagePath;
  final Color backgroundColor;

  const ChoicesSection({
    Key? key,
    required this.choiceText,
    required this.imagePath,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          PhotoDisplay(imagePath: imagePath),
          TextDisplay(
            backgroundColor: backgroundColor,
            choiceText: choiceText,
          ),
        ],
      ),
    );
  }
}
