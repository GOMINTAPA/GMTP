import 'package:flutter/material.dart';

class KeywordChip extends StatelessWidget {
  final String keyword;
  final VoidCallback onRemoved;

  const KeywordChip({
    Key? key,
    required this.keyword,
    required this.onRemoved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: const EdgeInsets.only(right: 10), // 각 키워드 간의 간격 설정
      padding: const EdgeInsets.only(left: 20), // 왼쪽 패딩 설정
      decoration: BoxDecoration(
        color: Colors.white, // 배경색
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: const Color(0xff0E83EF), width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 자식 위젯을 양 끝에 배치
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            keyword,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: onRemoved,
            icon: const Icon(Icons.close_rounded, size: 16), // 삭제 아이콘
            padding: const EdgeInsets.all(5), // 아이콘 버튼의 패딩 설정
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
