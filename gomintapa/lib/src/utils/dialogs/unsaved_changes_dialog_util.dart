import 'package:flutter/material.dart';

import 'dialog_util.dart';

// 사용자가 입력한 내용이 있는지 확인
bool hasUnsavedChanges({
  required String title,
  required String content,
  required String aInput,
  required String bInput,
}) {
  return title.isNotEmpty ||
      content.isNotEmpty ||
      aInput.isNotEmpty ||
      bInput.isNotEmpty;
}

// 변경 미저장 상태를 다루는 다이얼로그 표시
Future<void> handleUnsavedChangesDialog(
  BuildContext context,
  VoidCallback onConfirm,
) {
  return showConfirmationDialog(
    context,
    '현재 작성 중인 글이 있습니다.',
    '정말로 나가시겠습니까?',
    onConfirm,
  );
}
