import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LogoutButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 245, 56, 56),
        fixedSize: const Size(90, 40), // 버튼 크기 고정
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // 버튼의 모서리를 둥글게 설정
        ),
      ),
      child: const Text(
        '로그아웃',
        style: TextStyle(
          color: Colors.white, // 텍스트 색상을 흰색으로 설정
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
