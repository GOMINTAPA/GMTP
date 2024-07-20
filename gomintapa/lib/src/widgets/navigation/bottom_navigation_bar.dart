import 'package:flutter/material.dart';

final List<String> iconPaths = [
  'assets/images/makmak.png',
  'assets/images/home.png',
  'assets/images/tangtang.png'
];

final List<String> selectedIconPaths = [
  'assets/images/makmak_selected.png',
  'assets/images/home_selected.png',
  'assets/images/tangtang_selected.png'
];

class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  BottomNavigationBarWidget({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Color(0xffD9D9D9),
      items: List.generate(iconPaths.length, (index) {
        return BottomNavigationBarItem(
          icon: _buildIcon(index),
          label: '',
        );
      }),
      currentIndex: selectedIndex,
      onTap: onItemTapped,
    );
  }

  Widget _buildIcon(int index) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // 아이콘 이미지
        Image.asset(
          selectedIndex == index ? selectedIconPaths[index] : iconPaths[index],
          width: 45, // 아이콘의 너비
          height: 45, // 아이콘의 높이
        ),
        // 선택된 아이템일 때만 빨간색 바 표시
        if (selectedIndex == index)
          Positioned(
            bottom: -20, // 빨간색 바 위치
            child: Container(
              width: 80, // 빨간색 바의 너비
              height: 4, // 빨간색 바의 높이
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(100),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
