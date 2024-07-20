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
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          bottom: 0,
          left: MediaQuery.of(context).size.width /
                  iconPaths.length *
                  selectedIndex +
              (MediaQuery.of(context).size.width / iconPaths.length - 80) / 2,
          child: Container(
            width: 80,
            height: 4,
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

  Widget _buildIcon(int index) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Image.asset(
          selectedIndex == index ? selectedIconPaths[index] : iconPaths[index],
          width: 45,
          height: 45,
        ),
      ],
    );
  }
}
