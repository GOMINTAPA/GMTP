import 'package:flutter/material.dart';

import 'custom_input.dart';

class BInput extends StatelessWidget {
  final TextEditingController bInputController;
  final double containerWidth;

  const BInput({
    Key? key,
    required this.bInputController,
    required this.containerWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInput(
      inputController: bInputController,
      containerWidth: containerWidth,
      backgroundColor: Color(0xff5DB1FF),
      hintText: 'B 입력',
    );
  }
}
