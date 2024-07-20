import 'package:flutter/material.dart';

// 아이콘 이미지 경로
final List<String> iconPaths = [
  'assets/images/makmak.png',
  'assets/images/home.png',
  'assets/images/tangtang.png'
];

// 선택된 아이콘 이미지 경로
final List<String> selectedIconPaths = [
  'assets/images/makmak_selected.png',
  'assets/images/home_selected.png',
  'assets/images/tangtang_selected.png'
];

class BottomNavigationBarWidget extends StatelessWidget {
  // 현재 선택된 인덱스
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  BottomNavigationBarWidget({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        BottomNavigationBar(
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
        ),
        // 애니메이션 효과를 적용한 빨간색 바
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          bottom: 0, // 바닥에 고정
          left: MediaQuery.of(context).size.width /
                  iconPaths.length *
                  selectedIndex +
              (MediaQuery.of(context).size.width / iconPaths.length - 80) /
                  2, // 바의 위치 계산
          child: Container(
            width: 80, // 빨간색 바의 너비
            height: 4, // 빨간색 바의 높이
            decoration: BoxDecoration(
              color: Colors.red, // 빨간색
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(100), // 위쪽 모서리 둥글게
              ),
            ),
          ),
        ),
      ],
    );
  }

  // 인덱스에 따라 아이콘 반환
  Widget _buildIcon(int index) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Image.asset(
          selectedIndex == index ? selectedIconPaths[index] : iconPaths[index],
          width: 45, // 아이콘 너비
          height: 45, // 아이콘 높이
        ),
      ],
    );
  }
}
