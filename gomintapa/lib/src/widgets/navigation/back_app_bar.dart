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
          onPressed: () {},
          icon: Icon(Icons.arrow_back_rounded, size: 30),
        ),
      ),
    );
  }
}
