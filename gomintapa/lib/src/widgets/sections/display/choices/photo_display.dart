import 'package:flutter/material.dart';

class PhotoDisplay extends StatelessWidget {
  final String imagePath;

  const PhotoDisplay({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: const Color(0xff9B9B9B), width: 1),
      ),
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
      ),
    );
  }
}
