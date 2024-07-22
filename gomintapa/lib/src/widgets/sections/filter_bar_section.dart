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
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: 5),
          // 필터 버튼
          FilterButton(
            onPressed: onFilterPressed,
          ),
          SizedBox(width: 10),
          // 선택된 키워드 나열
          Row(
            children: selectedKeywords.map((keyword) {
              return Container(
                margin: EdgeInsets.only(right: 5),
                child: Chip(
                  label: Text(keyword),
                  deleteIcon: Icon(Icons.cancel_outlined, size: 16),
                  onDeleted: () => onKeywordRemoved(keyword),
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
