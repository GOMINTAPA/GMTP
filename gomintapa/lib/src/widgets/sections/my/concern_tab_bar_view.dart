import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gomintapa/src/controllers/feed_controller.dart';
import 'package:gomintapa/src/models/feed_model.dart';
import 'package:gomintapa/src/widgets/listitems/concern_list_item.dart';

class ConcernTabBarView extends StatelessWidget {
  final TabController controller;
  final FeedController feedController;

  const ConcernTabBarView({
    required this.controller,
    required this.feedController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final writtenConcerns =
          feedController.feedList.where((feed) => feed.isMe).toList(); // 작성한 고민
      final votedConcerns = <FeedModel>[]; // 참견한 고민 리스트는 빈 리스트로 설정

      return TabBarView(
        controller: controller,
        children: [
          // 작성한 고민 탭
          ListView(
            padding: const EdgeInsets.all(30),
            children: writtenConcerns.isEmpty
                ? [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // 이미지
                        Image.asset(
                          'assets/images/none_post.png',
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(height: 20),
                        // 텍스트
                        const Text(
                          "아직 작성한 고민이 없어요 :(",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ]
                : writtenConcerns
                    .map((concern) => ConcernListItem(concern))
                    .toList(),
          ),
          // 참견한 고민 탭
          ListView(
            padding: const EdgeInsets.all(30),
            children: votedConcerns.isEmpty
                ? [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // 이미지
                        Image.asset(
                          'assets/images/none_post.png',
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(height: 20),
                        // 텍스트
                        const Text(
                          "아직 참견한 고민이 없어요 :(",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ]
                : votedConcerns
                    .map((concern) => ConcernListItem(concern))
                    .toList(),
          ),
        ],
      );
    });
  }
}
