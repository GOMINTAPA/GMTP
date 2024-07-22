import 'package:flutter/material.dart';

// 첫 번째 선택 항목
class UpsideDownTrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, size.height); // 왼쪽 하단 모서리
    path.lineTo(size.width, size.height); // 오른쪽 하단 모서리
    path.lineTo(size.width - 40, 0); // 오른쪽 상단 모서리
    path.lineTo(0, 0); // 왼쪽 상단 모서리
    path.close(); // 경로 닫기
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// 두 번째 선택 항목
class BottomWideTrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, 0); // 왼쪽 상단 모서리
    path.lineTo(size.width, 0); // 오른쪽 상단 모서리
    path.lineTo(size.width, size.height); // 오른쪽 하단 모서리
    path.lineTo(size.width - 40, size.height); // 왼쪽 하단 모서리
    path.close(); // 경로 닫기
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

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
                      letterSpacing: 0.50,
                    ),
                    softWrap: false, // 줄바꿈을 하지 않음
                  ),
                ),
                const SizedBox(height: 18),
                // 선택 항목 영역
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // 항목들 사이의 간격을 최소화
                  children: [
                    // 첫 번째 선택 항목
                    ClipPath(
                      clipper: UpsideDownTrapezoidClipper(),
                      child: Container(
                        width: 90,
                        height: 80,
                        color: Color.fromARGB(255, 255, 155, 155), // 배경색
                        alignment: Alignment.center,
                        child: Text(
                          '선택 1',
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
                          softWrap: true, // 줄바꿈을 허용
                        ),
                      ),
                    ),
                    // 두 번째 선택 항목
                    ClipPath(
                      clipper: BottomWideTrapezoidClipper(),
                      child: Container(
                        width: 90,
                        height: 80,
                        color: Color.fromARGB(255, 93, 177, 255), // 배경색
                        alignment: Alignment.center,
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
        const SizedBox(height: 30), // 항목과 항목 사이의 간격 추가
      ],
    );
  }
}
