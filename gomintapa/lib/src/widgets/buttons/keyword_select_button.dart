import 'package:flutter/material.dart';

class KeywordSelectButton extends StatelessWidget {
  final VoidCallback onPressed;

  const KeywordSelectButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // 가능한 모든 너비를 사용
      height: 50, // 버튼 높이
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // 모서리 둥굴게 설정
          ),
          side: const BorderSide(
            color: Color(0xff9B9B9B), // 버튼 테두리
          ),
        ),
        child: const Text(
          '키워드 선택',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff9B9B9B),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
