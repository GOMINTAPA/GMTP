import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gomintapa/src/controllers/feed_controller.dart';
import 'package:gomintapa/src/widgets/listitems/concern_list_item.dart';

class ConcernTabBarView extends StatelessWidget {
  final TabController controller;
  final FeedController feedController;

  const ConcernTabBarView(
      {required this.controller, required this.feedController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final writtenConcerns =
          feedController.feedList.where((feed) => feed.isMe).toList(); // 작성한 고민
      return TabBarView(
        controller: controller,
        children: [
          ListView.builder(
            padding: const EdgeInsets.all(30),
            itemCount: writtenConcerns.length,
            itemBuilder: (context, index) {
              return ConcernListItem(writtenConcerns[index]);
            },
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
    });
  }
}
