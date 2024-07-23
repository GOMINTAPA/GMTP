import 'package:flutter/material.dart';

class BottomSection extends StatelessWidget {
  final Widget buttonWidget; // 로그아웃 대신 Widget을 받도록 수정

  const BottomSection({
    Key? key,
    required this.buttonWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 360,
        height: 60,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(right: 10), // 컨테이너 내부 여백 추가
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              buttonWidget, // 전달된 Widget을 사용
            ],
          ),
        ),
      ),
    );
  }
}
