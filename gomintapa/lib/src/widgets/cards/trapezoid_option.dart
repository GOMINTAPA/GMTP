import 'package:flutter/material.dart';

// 첫 번째 선택 항목
class UpsideDownTrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, size.height); // 왼쪽 하단 모서리
    path.lineTo(size.width, size.height); // 오른쪽 하단 모서리
    path.lineTo(size.width - 65, 0); // 오른쪽 상단 모서리
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
    path.lineTo(140, 0); // 오른쪽 상단 모서리
    path.lineTo(140, 88); // 오른쪽 하단 모서리
    path.lineTo(140 - 80, 88); // 왼쪽 하단 모서리
    path.close(); // 경로 닫기
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TrapezoidOption extends StatelessWidget {
  final String text;
  final Color color;
  final CustomClipper<Path> clipper;
  final Alignment alignment;
  final TextAlign textAlign;

  const TrapezoidOption({
    super.key,
    required this.text,
    required this.color,
    required this.clipper,
    required this.alignment,
    required this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: clipper,
      child: Container(
        width: 140,
        height: 88,
        color: color,
        alignment: alignment,
        child: Container(
          width: 100,
          height: 60,
          padding: const EdgeInsets.all(10.0), // 텍스트 주변 여백
          child: Text(
            text,
            maxLines: 2, // 최대 두 줄
            overflow: TextOverflow.ellipsis, // 텍스트 길이가 영역을 초과할 경우 말 줄임표 처리
            textAlign: textAlign,
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
    );
  }
}
