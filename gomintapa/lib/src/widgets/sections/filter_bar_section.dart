import 'package:flutter/material.dart';

import '../buttons/filter_button.dart';

class FilterSection extends StatelessWidget {
  final VoidCallback onFilterPressed;

  const FilterSection({Key? key, required this.onFilterPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffD9D9D9), // 배경색
      height: 40, // 높이
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: 5),
          FilterButton(
            onPressed: onFilterPressed,
          ),
          // 나중에 키워드 추가
        ],
      ),
    );
  }
}
