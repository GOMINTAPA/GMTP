import 'package:flutter/material.dart';

class ConcernTabBar extends StatelessWidget {
  final TabController controller;
  final int writtenConcernsCount; // 작성한 키워드 개수
  final int votedConcernsCount; // 참견한 키워드 개수

  const ConcernTabBar(
      {required this.controller,
      required this.writtenConcernsCount,
      required this.votedConcernsCount,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,

      // 탭 선택 스타일
      labelColor: Colors.black,
      labelStyle: const TextStyle(
        fontSize: 15,
        fontFamily: 'NanumSquare_ac',
        fontWeight: FontWeight.w700,
        letterSpacing: 0.50,
      ),

      // 탭 미선택 스타일
      unselectedLabelColor: Color.fromARGB(255, 155, 155, 155),
      unselectedLabelStyle: const TextStyle(
        fontSize: 15,
        fontFamily: 'NanumSquare_ac',
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

      tabs: [
        _buildTab("작성한 고민", writtenConcernsCount),
        _buildTab("투표한 고민", votedConcernsCount),
      ],
    );
  }

  Widget _buildTab(String label, int count) {
    return Tab(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: 'NanumSquare_ac',
                fontWeight: FontWeight.w700,
                letterSpacing: 0.50,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '$count',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'NanumSquare_ac',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
