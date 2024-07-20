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
          icon: Image.asset(
            selectedIndex == index
                ? selectedIconPaths[index]
                : iconPaths[index],
            width: 45,
            height: 45,
          ),
          label: '',
        );
      }),
      currentIndex: selectedIndex,
      onTap: onItemTapped,
    );
  }
}
