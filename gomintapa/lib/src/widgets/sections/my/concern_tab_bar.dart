import 'package:flutter/material.dart';

class ConcernTabBar extends StatelessWidget {
  final TabController controller;

  const ConcernTabBar({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,

      // 탭 선택 스타일
      labelColor: Colors.black,
      labelStyle: const TextStyle(
        fontSize: 15,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        letterSpacing: 0.50,
      ),

      // 탭 미선택 스타일
      unselectedLabelColor: Color.fromARGB(255, 155, 155, 155),
      unselectedLabelStyle: const TextStyle(
        fontSize: 15,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        letterSpacing: 0.50,
      ),

      // 탭 바 클릭시 나오는 splash effect 컬러
      overlayColor: MaterialStatePropertyAll(
        Color.fromARGB(255, 217, 217, 217),
      ),

      // indicator 설정
      indicatorColor: Colors.black,
      indicatorWeight: 2,
      indicatorSize: TabBarIndicatorSize.tab,

      tabs: const [
        Tab(text: "작성한 고민"),
        Tab(text: "참견한 고민"),
      ],
    );
  }
}
