import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController inputController;
  final double containerWidth;
  final Color backgroundColor;
  final String hintText;

  const CustomInput({
    Key? key,
    required this.inputController,
    required this.containerWidth,
    required this.backgroundColor,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth, // 비율에 맞게 설정된 너비
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: backgroundColor,
        border: Border(
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
        child: TextField(
          controller: inputController,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.only(bottom: 10.0),
          ),
          style: TextStyle(
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
