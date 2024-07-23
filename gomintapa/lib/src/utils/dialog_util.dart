import 'package:flutter/material.dart';

// 입력된 내용이 있는 경우, 사용자가 나가려 할 때 경고 메시지 표시
Future<void> showUnsavedChangesDialog(
  BuildContext context,
  VoidCallback onConfirm,
) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('현재 작성 중인 글이 있습니다.'),
        content: Text('정말로 나가시겠습니까?'),
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
