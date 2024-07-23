import 'package:flutter/material.dart';
import 'package:gomintapa/src/widgets/cards/card_bottom_section.dart';
import 'package:gomintapa/src/widgets/cards/card_section.dart';
import 'package:gomintapa/src/widgets/cards/card_top_section.dart';

class ConcernListItem extends StatelessWidget {
  final VoidCallback onTap; // onTap 콜백 추가
  const ConcernListItem({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardSection(
          onTap: onTap, // onTap 콜백 설정
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 제목 영역
              CardTopSection(
                title: '고민 제목',
              ),
              const SizedBox(height: 20),
              // 선택 항목 영역
              CardBottomSection(
                option1: '선택 1 내용',
                option2: '선택 2 내용',
              ),
            ],
          ),
        ),
        const SizedBox(height: 25), // ConcernListItem들 사이의 간격 추가
      ],
    );
  }
}
