import 'package:flutter/material.dart';

class KeywordChip extends StatelessWidget {
  final String keyword;

  const KeywordChip({
    Key? key,
    required this.keyword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: const EdgeInsets.only(right: 10), // 각 키워드 간의 간격 설정
      padding: const EdgeInsets.symmetric(horizontal: 27), // 좌우 패딩 설정
      decoration: BoxDecoration(
        color: Colors.white, // 배경색
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: const Color(0xff0E83EF), width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // 수평 중앙 정렬
        mainAxisSize: MainAxisSize.min,
        // 텍스트를 중앙에 배치
        children: [
          Text(
            keyword,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
