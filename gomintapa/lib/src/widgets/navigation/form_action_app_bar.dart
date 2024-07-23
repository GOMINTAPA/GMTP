import 'package:flutter/material.dart';

import '../sections/app_bar_section.dart';

class FormActionAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onClose;

  const FormActionAppBar({
    Key? key,
    required this.onClose,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60.0); // AppBar의 높이 설정

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSection(
        leading: IconButton(
          onPressed: () {
            onClose(); // 닫기 버튼 클릭 시 onClose 콜백 호출
          },
          icon: Icon(Icons.close_rounded, size: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.done_rounded, size: 30),
          ),
          SizedBox(width: 10), // 아이콘 버튼 사이 간격
        ],
      ),
    );
  }
}
