import 'package:flutter/material.dart';

// 일반적인 확인 다이얼로그
Future<void> showConfirmationDialog(
  BuildContext context,
  String title,
  String content,
  VoidCallback onConfirm,
) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // 다이얼로그 닫기
              onConfirm(); // 확인 버튼 클릭 시 동작
            },
            child: Text('네'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // 다이얼로그 닫기
            },
            child: Text('아니요'),
          ),
        ],
      );
    },
  );
}

// 오류 메시지를 표시하는 다이얼로그
void showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('제출 오류'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // 다이얼로그 닫기
            },
            child: Text('확인'),
          ),
        ],
      );
    },
  );
}
