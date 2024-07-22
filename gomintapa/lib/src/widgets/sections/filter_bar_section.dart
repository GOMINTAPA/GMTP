import 'package:flutter/material.dart';

import '../buttons/filter_button.dart';

class FilterBarSection extends StatelessWidget {
  final VoidCallback onFilterPressed; // 필터 버튼 클릭 콜백 함수
  final Set<String> selectedKeywords; // 선택된 키워드 집합
  final ValueChanged<String> onKeywordRemoved; // 키워드 삭제 콜백 함수

  // 생성자
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
      child: ListView(
        scrollDirection: Axis.horizontal, // 수평 스크롤 설정
        children: [
          SizedBox(width: 5), // 왼쪽 여백 추가
          FilterButton(
            onPressed: onFilterPressed,
          ),
          SizedBox(width: 10), // 필터 버튼과 선택된 키워드 사이의 여백
          // 선택된 키워드 나열
          Row(
            children: selectedKeywords.map((keyword) {
              return Container(
                margin: EdgeInsets.only(right: 5), // 각 키워드 간의 간격 설정
                child: Chip(
                  label: Text(keyword), // 키워드 텍스트
                  deleteIcon: Icon(Icons.cancel_outlined, size: 16), // 삭제 아이콘
                  onDeleted: () =>
                      onKeywordRemoved(keyword), // 삭제 아이콘 클릭 시 호출될 콜백 함수
                  backgroundColor: Colors.white, // 배경색
                  labelStyle: TextStyle(color: Colors.black),
                ),
              );
            }).toList(), // 선택된 키워드를 리스트로 변환
          ),
        ],
      ),
    );
  }
}
