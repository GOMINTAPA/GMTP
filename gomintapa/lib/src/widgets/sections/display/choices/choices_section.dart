import 'package:flutter/material.dart';
import 'package:gomintapa/src/widgets/sections/display/choices/large_text_display.dart';
import 'package:gomintapa/src/widgets/sections/display/choices/photo_display.dart';

import 'text_display.dart';

class ChoicesSection extends StatelessWidget {
  final String choiceText;
  final String? imagePath; // nullable로 변경
  final Color backgroundColor;

  const ChoicesSection({
    Key? key,
    required this.choiceText,
    this.imagePath, // nullable로 변경
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
          if (imagePath != null) ...[
            PhotoDisplay(imagePath: imagePath!),
            TextDisplay(
              backgroundColor: backgroundColor,
              choiceText: choiceText,
            ),
          ] else ...[
            LargeTextDisplay(
              backgroundColor: backgroundColor,
              choiceText: choiceText,
            ),
          ],
        ],
      ),
    );
  }
}
