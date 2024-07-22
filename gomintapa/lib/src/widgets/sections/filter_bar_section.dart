import 'package:flutter/material.dart';

import '../buttons/filter_button.dart';

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
          SizedBox(width: 1), // 왼쪽 여백 추가
          // 필터 버튼
          FilterButton(
            onPressed: onFilterPressed,
          ),
          SizedBox(width: 1), // 필터 버튼과 선택된 키워드 사이의 여백 추가
          // 선택된 키워드 나열
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // 수평 스크롤 설정
              child: Row(
                children: selectedKeywords.map((keyword) {
                  return Container(
                    width: 80,
                    height: 30,
                    margin: EdgeInsets.only(right: 10), // 각 키워드 간의 간격 설정
                    decoration: BoxDecoration(
                      color: Colors.white, // 배경색
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Color(0xff0E83EF), width: 1.5),
                    ),
                    child: Row(
                      // 요소들을 양쪽 끝에 배치
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 20), // 텍스트 왼쪽 여백
                        Expanded(
                          child: Text(
                            keyword,
                            textAlign: TextAlign.center, // 텍스트 가운데 정렬
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => onKeywordRemoved(keyword),
                          icon: Icon(Icons.close_rounded, size: 16), // 삭제 아이콘
                          padding: EdgeInsets.all(5), // 아이콘 버튼의 패딩 설정
                          constraints: BoxConstraints(),
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
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
