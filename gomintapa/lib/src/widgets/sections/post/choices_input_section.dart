import 'package:flutter/material.dart';

import '../../forms/input/custom_input.dart';
import '../../forms/input/photo_attachment.dart';

class ChoicesInputSection extends StatelessWidget {
  final TextEditingController inputController;
  final String hintText;
  final Color backgroundColor;
  final double containerWidth;

  const ChoicesInputSection({
    Key? key,
    required this.inputController,
    required this.hintText,
    required this.backgroundColor,
    required this.containerWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 공통 패딩 상수
    const EdgeInsets containerPadding = EdgeInsets.only(
      left: 40,
      right: 40,
      bottom: 20,
      top: 0,
    );

    return Container(
      color: Colors.white,
      padding: containerPadding,
      child: Column(
        children: [
          const SizedBox(height: 30),
          PhotoAttachment(containerWidth: containerWidth),
          CustomInput(
            inputController: inputController,
            containerWidth: containerWidth,
            backgroundColor: backgroundColor,
            hintText: hintText,
          ),
        ],
      ),
    );
  }
}
