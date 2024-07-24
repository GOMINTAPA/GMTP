import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gomintapa/src/controllers/feed_controller.dart';
import 'package:gomintapa/src/widgets/sections/my/concern_tab_bar.dart';
import 'package:gomintapa/src/widgets/sections/my/concern_tab_bar_view.dart';

class ConcernFeedSection extends StatefulWidget {
  const ConcernFeedSection({super.key});

  @override
  State<ConcernFeedSection> createState() => _ConcernFeedSectionState();
}

class _ConcernFeedSectionState extends State<ConcernFeedSection>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final FeedController feedController = Get.put(FeedController());

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 2, // 탭 바 개수
      vsync: this,
      initialIndex: 0, // 초기에 보여줄 탭 바 인덱스
      animationDuration: const Duration(milliseconds: 800), // 탭 변경 애니메이션 시간
    );

    feedController.feedIndex(); // 초기 피드 데이터를 로드
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
          ConcernTabBar(controller: tabController), // TabBar
          // Expanded 없으면 오류 발생
          Expanded(
              child: ConcernTabBarView(
                  controller: tabController,
                  feedController: feedController)), // TabBarView
        ],
      ),
    );
  }
}
