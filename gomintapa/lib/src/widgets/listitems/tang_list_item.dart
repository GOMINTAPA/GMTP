import 'package:flutter/material.dart';
import 'package:gomintapa/src/widgets/cards/card_section.dart';
import 'package:gomintapa/src/widgets/cards/card_top_section.dart';
import 'package:gomintapa/src/widgets/cards/trapezoid_option.dart';

class TangListItem extends StatelessWidget {
  final VoidCallback onTap; // onTap 콜백 추가
  final bool isOption1Winner; // 첫 번째 옵션이 이겼는지 여부
  final bool isOption2Winner; // 두 번째 옵션이 이겼는지 여부

  const TangListItem({
    super.key,
    required this.onTap,
    required this.isOption1Winner,
    required this.isOption2Winner,
  });

  @override
  Widget build(BuildContext context) {
    // 결과에 따른 고민 카드 배경 색상 변경
    Color containerColor;
    if (isOption1Winner) {
      containerColor = Color.fromARGB(255, 255, 230, 224); // 1옵션이 이겼을 때 색상
    } else if (isOption2Winner) {
      containerColor = Color.fromARGB(255, 234, 240, 255); // 2옵션이 이겼을 때 색상
    } else {
      containerColor = Color(0xFFF4F4F4); // 기본 색상
    }

    return Column(
      children: [
        const SizedBox(height: 25),
        CardSection(
          onTap: onTap,
          backgroundColor: containerColor, // 배경 색상 전달
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 이미지 아이콘과 제목 영역을 포함하는 Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 이미지 아이콘
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 5.0), // 아이콘과 제목 사이의 간격
                    child: Image.asset(
                      'assets/images/tangtang_selected.png',
                      width: 42,
                      height: 42,
                    ),
                  ),
                  // 제목 영역
                  Expanded(
                    child: CardTopSection(
                      title: '고민 제목',
                    ),
                  ),
                ],
              ),
              // 선택 항목 영역
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 90.0),
                    // 첫 번째 선택 항목
                    child: TrapezoidOption(
                      text: '선택 1 내용',
                      color: isOption1Winner
                          ? Color.fromARGB(255, 255, 155, 155) // 이긴 경우
                          : isOption2Winner
                              ? Color.fromARGB(255, 155, 155, 155) // 진 경우
                              : Color.fromARGB(255, 255, 155, 155), // 기본 색상
                      clipper: UpsideDownTrapezoidClipper(), // 클리퍼 추가
                      alignment: Alignment.centerLeft,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // 두 번째 선택 항목
                  Padding(
                    padding: const EdgeInsets.only(left: 90.0),
                    // 첫 번째 선택 항목
                    child: TrapezoidOption(
                      text: '선택 2 내용선택 2 내용선택 2 내용선택 2 내용선택 2 내용',
                      color: isOption2Winner
                          ? Color.fromARGB(255, 93, 177, 255) // 이긴 경우
                          : isOption1Winner
                              ? Color.fromARGB(255, 155, 155, 155) // 진 경우
                              : Color.fromARGB(255, 93, 177, 255), // 기본 색상
                      clipper: BottomWideTrapezoidClipper(), // 클리퍼 추가
                      alignment: Alignment.centerRight,
                      textAlign: TextAlign.center,
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
