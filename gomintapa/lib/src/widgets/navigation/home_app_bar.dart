import 'package:flutter/material.dart';

import '../sections/app_bar_section.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0); // AppBar의 높이 설정

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSection(
        actions: [
          IconButton(
            onPressed: () {
              // 검색 버튼 클릭 시 동작
            },
            icon: Icon(Icons.search_rounded, size: 30),
          ),
          SizedBox(width: 10), // 아이콘 버튼 사이 간격
          IconButton(
            onPressed: () {
              // 계정 버튼 클릭 시 동작
            },
            icon: Icon(Icons.account_box_rounded, size: 30),
          ),
          SizedBox(width: 10), // 아이콘 버튼 사이 간격
        ],
      ),
    );
  }
}
