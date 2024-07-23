import 'package:flutter/material.dart';

class ConcernListItem extends StatelessWidget {
  final VoidCallback onTap; // onTap 콜백 추가
  const ConcernListItem({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap, // onTap 콜백 설정
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
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 제목 영역
                Container(
                  width: 285,
                  height: 20,
                  alignment: Alignment.center,
                  child: Text(
                    '고민 제목',
                    maxLines: 1, // 텍스트가 한 줄로 제한됨
                    overflow:
                        TextOverflow.ellipsis, // 텍스트 길이가 영역을 초과할 경우 말 줄임표 처리
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w800,
                    ),
                    softWrap: false, // 줄바꿈을 하지 않음
                  ),
                ),
                const SizedBox(height: 20),
                // 선택 항목 영역
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // 항목들 사이의 간격을 최소화
                  children: [
                    // 첫 번째 선택 항목
                    Container(
                      width: 135,
                      height: 88,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 155, 155), // 배경색
                        borderRadius:
                            BorderRadius.circular(5), // borderRadius 추가
                      ),
                      alignment: Alignment.center,
                      child: Container(
                        width: 120,
                        height: 60,
                        padding: const EdgeInsets.all(10.0), // 텍스트 주변 여백
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
                        padding: const EdgeInsets.all(10.0), // 텍스트 주변 여백
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
        ),
        const SizedBox(height: 25), // ConcernListItem들 사이의 간격 추가
      ],
    );
  }
}
