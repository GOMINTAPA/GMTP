import 'package:flutter/material.dart';

import 'custom_input.dart';

class AInput extends StatelessWidget {
  final TextEditingController aInputController;
  final double containerWidth;

  const AInput({
    Key? key,
    required this.aInputController,
    required this.containerWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInput(
      inputController: aInputController,
      containerWidth: containerWidth,
      backgroundColor: Color(0xffFF9B9B),
      hintText: 'A 입력',
    );
  }
}
