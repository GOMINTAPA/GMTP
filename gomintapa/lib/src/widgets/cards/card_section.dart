import 'package:flutter/material.dart';

class CardSection extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final Color? backgroundColor;

  const CardSection({
    Key? key,
    required this.child,
    required this.onTap,
    /*기본 색상 설정*/
    this.backgroundColor = const Color(0xFFF4F4F4),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 150,
        decoration: BoxDecoration(
          color: backgroundColor,
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
        child: child,
      ),
    );
  }
}
