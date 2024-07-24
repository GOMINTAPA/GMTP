import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gomintapa/src/controllers/feed_controller.dart';
import 'package:gomintapa/src/widgets/listitems/concern_list_item.dart';

import '../../widgets/buttons/create_post_button.dart';

class FeedIndex extends StatefulWidget {
  const FeedIndex({super.key});

  @override
  State<FeedIndex> createState() => _FeedIndexState();
}

class _FeedIndexState extends State<FeedIndex> {
  final feedController = Get.put(FeedController());
  int _currentPage = 1;

  bool _onNotification(ScrollNotification scrollInfo) {
    if (scrollInfo is ScrollEndNotification &&
        scrollInfo.metrics.extentAfter == 0) {
      feedController.feedIndex(page: ++_currentPage);
      return true;
    }
    return false;
  }

  Future<void> _onRefresh() async {
    _currentPage = 1;
    await feedController.feedIndex();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Obx(
                  () => NotificationListener<ScrollNotification>(
                    onNotification: _onNotification,
                    child: RefreshIndicator(
                      onRefresh: _onRefresh,
                      child: ListView.builder(
                        itemCount: feedController.feedList.length,
                        itemBuilder: (context, index) {
                          final item = feedController.feedList[index];
                          return ConcernListItem(item);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // 하단 중앙에 위치한 '고민 작성' 버튼
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: CreatePostButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/create_post');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
