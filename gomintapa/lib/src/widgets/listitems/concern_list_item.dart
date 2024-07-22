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
                Container(
                  width: 285,
                  height: 20,
                  alignment: Alignment.center,
                  child: Text(
                    '고민 제목 123456789000000000000', // 이 텍스트를 원하는 제목으로 변경하세요.
                    maxLines: 1, // 텍스트가 한 줄로 제한됨
                    overflow:
                        TextOverflow.ellipsis, // 텍스트 길이가 영역을 초과할 경우 말 줄임표 처리
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.50,
                    ),
                    softWrap: false, // 줄바꿈을 하지 않음
                  ),
                ),
                const SizedBox(height: 18),
                // 선택 항목 영역
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 120,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 155, 155),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child: Center(
                        child: SizedBox(
                          width: 100,
                          height: 50,
                          child: Center(
                            child: Text(
                              '선택 111111111111',
                              maxLines: 2, // 최대 두 줄
                              overflow: TextOverflow
                                  .ellipsis, // 텍스트 길이가 영역을 초과할 경우 말 줄임표 처리
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.50,
                              ),
                              softWrap: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 93, 177, 255),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child: Center(
                        child: SizedBox(
                          width: 100,
                          height: 50,
                          child: Center(
                            child: Text(
                              '선택 2',
                              maxLines: 2, // 최대 두 줄
                              overflow: TextOverflow
                                  .ellipsis, // 텍스트 길이가 영역을 초과할 경우 말 줄임표 처리
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.50,
                              ),
                              softWrap: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30), // 항목과 항목 사이의 간격 추가
      ],
    );
  }
}
