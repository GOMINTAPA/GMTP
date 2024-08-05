import 'package:flutter/material.dart';

class LargeTextDisplay extends StatelessWidget {
  final Color backgroundColor;
  final String choiceText;

  const LargeTextDisplay({
    Key? key,
    required this.backgroundColor,
    required this.choiceText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: backgroundColor,
        border: Border.all(
          color: const Color(0xff9B9B9B),
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          choiceText,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'NanumSquare_ac',
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
