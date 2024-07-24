import 'package:flutter/material.dart';

import '../../widgets/sections/keyword/keyword_list_modal.dart';

Future<Set<String>?> showKeywordModal({
  required BuildContext context,
  required Set<String> selectedKeywords,
}) {
  return showModalBottomSheet<Set<String>>(
    context: context,
    backgroundColor: Colors.transparent, // 바텀 시트의 배경색을 투명으로 설정
    builder: (BuildContext context) {
      return KeywordListModal(
        initialSelectedKeywords: selectedKeywords,
        onApply: (selectedKeywords) {
          Navigator.pop(context, selectedKeywords);
        },
        onClose: () => Navigator.pop(context), // 바텀 시트를 닫기 위한 콜백
      );
    },
  );
}
