import 'package:flutter/material.dart';

import 'field_validation_util.dart';
import '../utils/dialog_util.dart';

// 제출 로직 처리
void handleSubmitPost({
  required BuildContext context,
  required String title,
  required String content,
  required String aInput,
  required String bInput,
}) {
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

  // TODO: 제출 로직 구현 (예: 서버에 데이터 전송, 로컬 저장 등)
  // 현재는 임시로 데이터 출력으로 대체
  print('제목: $title');
  print('내용: $content');
  print('A 입력: $aInput');
  print('B 입력: $bInput');

  // 제출이 완료된 후 이전 화면으로 돌아가기
  Navigator.pop(context);
}
