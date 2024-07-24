import 'package:flutter/material.dart';

import '../sections/feed/app_bar_section.dart';

class FormActionAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onClose; // 닫기 버튼 콜백
  final VoidCallback onSubmit; // 제출 버튼 콜백

  const FormActionAppBar({
    Key? key,
    required this.onClose,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60.0); // AppBar의 높이 설정

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSection(
        leading: IconButton(
          onPressed: onClose,
          icon: Icon(Icons.close_rounded, size: 30),
        ),
        actions: [
          IconButton(
            onPressed: onSubmit,
            icon: Icon(Icons.done_rounded, size: 30),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
