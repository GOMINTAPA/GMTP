import 'package:flutter/material.dart';
import 'package:gomintapa/src/widgets/cards/card_bottom_section.dart';
import 'package:gomintapa/src/widgets/cards/card_section.dart';
import 'package:gomintapa/src/widgets/cards/card_top_section.dart';
import 'package:gomintapa/src/widgets/texts/custom_text.dart';

class MakListItem extends StatelessWidget {
  final VoidCallback onTap; // onTap 콜백 추가

  const MakListItem({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),
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
              Stack(
                clipBehavior: Clip.none, // Stack의 클리핑 설정
                children: [
                  CardBottomSection(
                    option1: '선택 1 내용',
                    option2: '선택 2 내용',
                  ),
                  // 중앙 텍스트 영역
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 55,
                    child: Align(
                      alignment: Alignment.center,
                      child: CustomTextWidget(
                        strokeColorForMainText: Colors.white,
                        solidColorForMainText: Colors.red,
                        strokeColorForBorderText: Colors.white,
                        solidColorForBorderText: Colors.black,
                        mainText: '0%',
                        borderText: '차이',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10), // ConcernListItem들 사이의 간격 추가
      ],
    );
  }
}
