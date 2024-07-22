import 'package:flutter/material.dart';

class ConcernListItem extends StatelessWidget {
  const ConcernListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            width: 300,
            height: 150,
            decoration: BoxDecoration(
              color: Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 제목 영역
                Text(
                  '고민 제목 ',
                  overflow:
                      TextOverflow.ellipsis, // 제목 길이가 한 줄을 초과할 경우 말 줄임표 처리
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.50,
                  ),
                ),
                const SizedBox(height: 18),
                // 선택 항목 영역
              ],
            ),
          ),
        ),
        const SizedBox(height: 30), // 항목과 항목 사이의 간격 추가
      ],
    );
  }
}
