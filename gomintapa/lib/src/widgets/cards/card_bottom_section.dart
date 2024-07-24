import 'package:flutter/material.dart';
import 'package:gomintapa/src/widgets/cards/trapezoid_option.dart';

class CardBottomSection extends StatelessWidget {
  final String option1;
  final String option2;

  const CardBottomSection({
    super.key,
    required this.option1,
    required this.option2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Stack의 클리핑 설정
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 90.0), // 오른쪽에 10픽셀의 패딩 추가
          child: TrapezoidOption(
            text: option1,
            color: Color.fromARGB(255, 255, 155, 155),
            clipper: UpsideDownTrapezoidClipper(),
            alignment: Alignment.centerLeft,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 90.0), // 왼쪽에 10픽셀의 패딩 추가
          child: TrapezoidOption(
            text: option2,
            color: Color.fromARGB(255, 93, 177, 255),
            clipper: BottomWideTrapezoidClipper(),
            alignment: Alignment.centerRight,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
