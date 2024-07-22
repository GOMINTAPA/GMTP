import 'package:flutter/material.dart';
import 'package:gomintapa/src/widgets/sections/app_bar_section.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0); // AppBar의 높이 설정

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSection(
        leading: IconButton(
          onPressed: () {
            // 현재 화면을 닫고 이전 화면으로 돌아가기
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded, size: 30),
        ),
      ),
    );
  }
}
