import 'package:flutter/material.dart';

class ConcernTabBar extends StatelessWidget {
  final TabController controller;

  const ConcernTabBar({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      labelColor: Colors.black,
      unselectedLabelColor: Color.fromARGB(255, 217, 217, 217),
      labelStyle: const TextStyle(
        fontSize: 15,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        letterSpacing: 0.50,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 15,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        letterSpacing: 0.50,
      ),

      // 탭 바 클릭시 나오는 splash effect 컬러
      overlayColor: MaterialStatePropertyAll(
        Colors.white,
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
