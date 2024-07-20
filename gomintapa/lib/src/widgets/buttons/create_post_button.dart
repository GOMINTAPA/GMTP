import 'package:flutter/material.dart';

class CreatePostButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CreatePostButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // 여백 추가
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(Icons.edit_outlined, color: Colors.red),
        label: Text(
          '고민 작성',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, // 배경색
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25), // 모서리 둥글기
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20), // 패딩
        ),
      ),
    );
  }
}
