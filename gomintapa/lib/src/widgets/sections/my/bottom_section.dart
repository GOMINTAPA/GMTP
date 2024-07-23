import 'package:flutter/material.dart';

class BottomSection extends StatelessWidget {
  final Widget buttonWidget; // 로그아웃 대신 Widget을 받도록 수정

  const BottomSection({
    Key? key,
    required this.buttonWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // 화면 너비에 맞추기
      height: 60,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Align(
          alignment: Alignment.centerRight, // 오른쪽 정렬
          child: buttonWidget, // 전달된 Widget을 사용
        ),
      ),
    );
  }
}
