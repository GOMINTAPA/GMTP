import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gomintapa/src/models/feed_model.dart';
import 'package:gomintapa/src/widgets/cards/card_bottom_section.dart';
import 'package:gomintapa/src/widgets/cards/card_section.dart';
import 'package:gomintapa/src/widgets/cards/card_top_section.dart';

import '../../screens/post/post_detail.dart';

class ConcernListItem extends StatelessWidget {
  final FeedModel item;
  const ConcernListItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25), // ConcernListItem들 사이의 간격 추가
        CardSection(
          onTap: () {
            Get.to(() => PostDetail(feedModel: item)); // FeedModel을 전달
          }, // onTap 콜백 설정
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 5,
              ),
              // 제목 영역
              CardTopSection(
                title: item.title,
              ),
              const SizedBox(height: 10),
              // 선택 항목 영역
              CardBottomSection(
                option1: item.firstOption,
                option2: item.secondOption,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10), // ConcernListItem들 사이의 간격 추가
      ],
    );
  }
}
