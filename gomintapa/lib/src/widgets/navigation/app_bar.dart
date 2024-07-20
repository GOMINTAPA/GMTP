import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0); // AppBar의 높이 설정

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: SizedBox(
        height: 60.0,
        child: Image.asset(
          'assets/images/gomintapa_logo.png',
          fit: BoxFit.contain,
        ),
      ),
      backgroundColor: Color(0xffD9D9D9),
      actions: [
        IconButton(
          onPressed: () {
            // 검색 버튼 클릭 시 동작
          },
          icon: Icon(Icons.search, size: 30),
        ),
        SizedBox(width: 10),
        IconButton(
          onPressed: () {
            // 계정 버튼 클릭 시 동작
          },
          icon: Icon(Icons.account_box_rounded, size: 30),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
