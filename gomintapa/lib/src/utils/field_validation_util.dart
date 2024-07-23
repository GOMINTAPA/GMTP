// 입력 필드의 내용이 모두 채워져 있는지 확인
bool areFieldsNotEmpty({
  required String title,
  required String content,
  required String aInput,
  required String bInput,
}) {
  return title.isNotEmpty &&
      content.isNotEmpty &&
      aInput.isNotEmpty &&
      bInput.isNotEmpty;
}
