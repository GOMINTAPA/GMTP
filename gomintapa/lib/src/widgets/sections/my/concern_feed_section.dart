import 'package:flutter/material.dart';
import 'package:gomintapa/src/widgets/sections/my/concern_tab_bar.dart';

class ConcernFeedSection extends StatefulWidget {
  const ConcernFeedSection({super.key});

  @override
  State<ConcernFeedSection> createState() => _ConcernFeedSectionState();
}

class _ConcernFeedSectionState extends State<ConcernFeedSection>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(
    length: 2, // 탭 바 개수
    vsync: this,
    initialIndex: 0, // 초기에 보여줄 탭 바 인덱스

    // 탭 변경 애니메이션 시간
    animationDuration: const Duration(milliseconds: 800),
  );

  @override
  void initState() {
    tabController.addListener(() {});
    // 프레임당 콜백
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ConcernTabBar(controller: tabController),
          // Expanded 없으면 오류 발생
          Expanded(child: _tabBarView()),
        ],
      ),
    );
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: tabController,
      children: [
        ListView(
          padding: const EdgeInsets.all(30),
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                "작성한 고민",
                style: TextStyle(fontSize: 40, color: Colors.black),
              ),
            ),
          ],
        ),
        ListView(
          padding: const EdgeInsets.all(30),
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                "참견한 고민",
                style: TextStyle(fontSize: 40, color: Colors.black),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
