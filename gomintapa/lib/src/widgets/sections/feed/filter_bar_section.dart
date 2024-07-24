import 'package:flutter/material.dart';

import '../../buttons/filter_button.dart';
import '../../buttons/keyword_chip.dart';

class FilterBarSection extends StatelessWidget {
  final VoidCallback onFilterPressed;
  final Set<String> selectedKeywords; // 선택된 키워드 집합
  final ValueChanged<String> onKeywordRemoved; // 키워드 삭제 콜백 함수

  const FilterBarSection({
    Key? key,
    required this.onFilterPressed,
    required this.selectedKeywords,
    required this.onKeywordRemoved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffD9D9D9), // 배경색
      height: 40, // 높이
      child: Row(
        children: [
          const SizedBox(width: 1), // 왼쪽 여백 추가
          // 필터 버튼
          FilterButton(
            onPressed: onFilterPressed,
          ),
          const SizedBox(width: 1), // 필터 버튼과 선택된 키워드 사이의 여백 추가
          // 선택된 키워드 나열
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // 수평 스크롤 설정
              child: Row(
                children: selectedKeywords.map((keyword) {
                  return KeywordChip(
                    keyword: keyword,
                    onRemoved: () => onKeywordRemoved(keyword),
                  );
                }).toList(), // 선택된 키워드를 리스트로 변환
              ),
            ),
          ),
        ],
      ),
    );
  }
}
