import 'package:flutter/material.dart';

// FilterSheet에서 사용되는 버튼 정의
class FilterSheetButton extends StatelessWidget {
  final String text; // 버튼에 표시할 텍스트
  final bool isSelected; // 버튼 선택 여부
  final VoidCallback onPressed; // 버튼 클릭 시 호출될 콜백 함수

  // 생성자
  const FilterSheetButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // 버튼의 너비와 높이 설정
      width: 80,
      height: 40,

      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            // 버튼이 선택된 상태에 따라 텍스트 색상을 다르게 설정
            color: isSelected ? Color(0xff0E83EF) : Colors.black,
          ),
        ),

        // 버튼의 스타일 정의
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 1.5,
            // 버튼이 선택된 상태에 따라 테두리 색상을 다르게 설정
            color: isSelected ? Color(0xff0E83EF) : Color(0xffA7A7A7),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
