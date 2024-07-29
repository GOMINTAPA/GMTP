import 'package:flutter/material.dart';

class TextDisplay extends StatelessWidget {
  final Color backgroundColor;
  final String choiceText;

  const TextDisplay({
    Key? key,
    required this.backgroundColor,
    required this.choiceText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: backgroundColor,
        border: const Border(
          bottom: BorderSide(
            color: Color(0xff9B9B9B),
            width: 1,
          ),
          left: BorderSide(
            color: Color(0xff9B9B9B),
            width: 1,
          ),
          right: BorderSide(
            color: Color(0xff9B9B9B),
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: Text(
          choiceText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
