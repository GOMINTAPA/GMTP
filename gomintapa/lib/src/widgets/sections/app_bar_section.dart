import 'package:flutter/material.dart';

class AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final List<Widget>? actions;

  AppBarSection({this.leading, this.actions});

  @override
  Size get preferredSize => Size.fromHeight(60.0); // AppBar의 높이 설정

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true, // title 중앙 배치
      title: SizedBox(
        height: 60.0, // title 높이 설정
        child: Image.asset(
          'assets/images/gomintapa_logo.png',
          fit: BoxFit.contain, // 이미지의 비율을 유지하며 컨테이너 내에서 적절하게 조정
        ),
      ),
      backgroundColor: Color(0xffD9D9D9), // 상단바 배경색
      leading: leading,
      actions: actions,
    );
  }
}
