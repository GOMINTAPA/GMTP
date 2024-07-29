import 'package:flutter/material.dart';

import 'field_validation_util.dart';
import 'dialog_util.dart';

// 제출 로직 처리
void handleSubmitPost({
  required BuildContext context,
  required String title,
  required String content,
  required String aInput,
  required String bInput,
  required Function onSubmit, // 제출 로직을 함수로 전달받음
}) async {
  // 제목, 내용, A입력, B입력이 모두 비어있지 않은지 확인
  if (!areFieldsNotEmpty(
    title: title,
    content: content,
    aInput: aInput,
    bInput: bInput,
  )) {
    // 모든 필드가 채워져야 함
    showErrorDialog(context, '모든 필드를 입력해 주세요.');
    return;
  }

  // 제출 로직 실행
  await onSubmit();

  // 제출이 완료된 후 이전 화면으로 돌아가기
  Navigator.pop(context);
}
