import 'package:flutter/material.dart';
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
                /*  mainAxisAlignment:
                      MainAxisAlignment.center, // 항목들 사이의 간격을 최소화
                   */
                children: [
                  // 첫 번째 선택 항목
                  Container(
                    width: 135,
                    height: 88,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 155, 155), // 배경색
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

                  // 두 번째 선택 항목
                  Positioned(
                    left: 145,
                    child: Container(
                      width: 135,
                      height: 88,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 93, 177, 255), // 배경색
                        borderRadius:
                            BorderRadius.circular(5), // borderRadius 추가
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
                  ),
                  //중앙 텍스트 영역
                  Container(
                    alignment: Alignment.center,
                    child: CustomTextWidget(
                      strokeColorForMainText: Colors.white, // ?%의 테두리 색상
                      solidColorForMainText: Colors.red, // ?%의 채우기 색상
                      strokeColorForBorderText: Colors.white, // 차이의 테두리 색상
                      solidColorForBorderText: Colors.black, // 차이의 채우기 색상
                      mainText: '?%',
                      borderText: '차이',
                    ),
                  )
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
