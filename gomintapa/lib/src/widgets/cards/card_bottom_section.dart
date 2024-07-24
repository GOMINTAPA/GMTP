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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TrapezoidOption(
          text: option1,
          color: Color.fromARGB(255, 255, 155, 155),
          clipper: UpsideDownTrapezoidClipper(),
          alignment: Alignment.centerLeft,
          textAlign: TextAlign.left,
        ),
        const SizedBox(width: 10),
        TrapezoidOption(
          text: option2,
          color: Color.fromARGB(255, 93, 177, 255),
          clipper: BottomWideTrapezoidClipper(),
          alignment: Alignment.centerRight,
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
