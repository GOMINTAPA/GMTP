import 'package:flutter/material.dart';
import 'package:gomintapa/src/widgets/cards/card_section.dart';
import 'package:gomintapa/src/widgets/cards/card_top_section.dart';

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
        CardSection(
          onTap: onTap,
          backgroundColor: containerColor, // 배경 색상 전달
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 이미지 아이콘과 제목 영역을 포함하는 Row
              Row(
                children: [
                  // 이미지 아이콘
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 8.0), // 아이콘과 제목 사이의 간격
                    child: Image.asset(
                      'assets/images/tangtang_selected.png',
                      width: 45,
                      height: 45,
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
              const SizedBox(height: 5),
              // 선택 항목 영역
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // 항목들 사이의 간격을 최소화
                children: [
                  // 첫 번째 선택 항목
                  Container(
                    width: 135,
                    height: 78,
                    decoration: BoxDecoration(
                      color: isOption1Winner
                          ? Color.fromARGB(255, 255, 155, 155) // 이긴 경우
                          : isOption2Winner
                              ? Color.fromARGB(255, 155, 155, 155) // 진 경우
                              : Color.fromARGB(255, 255, 155, 155), // 기본 색상
                      borderRadius: BorderRadius.circular(5), // borderRadius 추가
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      width: 120,
                      height: 60,
                      padding: const EdgeInsets.all(5), // 텍스트 주변 여백
                      alignment: Alignment.center,
                      child: Text(
                        '선택 1 내용',
                        maxLines: 2, // 최대 두 줄
                        overflow: TextOverflow
                            .ellipsis, // 텍스트 길이가 영역을 초과할 경우 말 줄임표 처리
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                        softWrap: true, // 줄바꿈을 허용
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // 두 번째 선택 항목
                  Container(
                    width: 135,
                    height: 78,
                    decoration: BoxDecoration(
                      color: isOption2Winner
                          ? Color.fromARGB(255, 93, 177, 255) // 이긴 경우
                          : isOption1Winner
                              ? Color.fromARGB(255, 155, 155, 155) // 진 경우
                              : Color.fromARGB(255, 93, 177, 255), // 기본 색상
                      borderRadius: BorderRadius.circular(5), // borderRadius 추가
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      width: 120,
                      height: 60,
                      padding: const EdgeInsets.all(5), // 텍스트 주변 여백
                      alignment: Alignment.center,
                      child: Text(
                        '선택 2 내용',
                        maxLines: 2, // 최대 두 줄
                        overflow: TextOverflow
                            .ellipsis, // 텍스트 길이가 영역을 초과할 경우 말 줄임표 처리
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                        softWrap: true, // 줄바꿈을 허용
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 25), // ConcernListItem들 사이의 간격 추가
      ],
    );
  }
}
