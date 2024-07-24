import 'package:flutter/material.dart';

import '../../buttons/keyword_chip/removable_keyword_chip.dart';

class RemovableKeywordSection extends StatelessWidget {
  final Set<String> selectedKeywords;
  final ValueChanged<String> onKeywordRemoved;

  const RemovableKeywordSection({
    Key? key,
    required this.selectedKeywords,
    required this.onKeywordRemoved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9, // 키워드 섹션의 너비 설정
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (selectedKeywords.isEmpty)
            const Text(
              '키워드를 선택해주세요',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xffA7A7A7),
                fontWeight: FontWeight.bold,
              ),
            )
          else
            Wrap(
              runSpacing: 15.0,
              children: selectedKeywords.map((keyword) {
                return RemovableKeywordChip(
                  keyword: keyword,
                  onRemoved: () => onKeywordRemoved(keyword),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}
