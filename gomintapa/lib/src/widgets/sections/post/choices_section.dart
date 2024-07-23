import 'package:flutter/material.dart';

import '../../forms/custom_input.dart';
import '../../forms/photo_attachment.dart';

class ChoicesSection extends StatelessWidget {
  final TextEditingController inputController;
  final String hintText;
  final Color backgroundColor;

  const ChoicesSection({
    Key? key,
    required this.inputController,
    required this.hintText,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 화면의 너비를 비율로 계산
    final double screenWidth = MediaQuery.of(context).size.width;
    final double containerWidth = screenWidth * 0.9; // 화면 너비의 90%로 설정

    // 공통 패딩 상수
    const EdgeInsets containerPadding = EdgeInsets.only(
      left: 40,
      right: 40,
      bottom: 40,
      top: 10,
    );

    return Container(
      color: Colors.white,
      padding: containerPadding,
      child: Column(
        children: [
          const Divider(
            thickness: 0.5,
            color: Color(0xffA7A7A7),
            height: 0, // Divider 위아래의 공간 제거
          ),
          const SizedBox(height: 40),
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
