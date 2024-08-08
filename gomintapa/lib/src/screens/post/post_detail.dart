import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:gomintapa/src/controllers/feed_controller.dart';

import '../../models/feed_model.dart';
import '../../widgets/navigation/back_app_bar.dart';
import '../../widgets/sections/display/choices/choices_section.dart';
import '../../widgets/sections/display/content_section.dart';
import '../../widgets/sections/display/profile_section.dart';
import '../../widgets/sections/display/keyword_section.dart';

class PostDetail extends StatefulWidget {
  final FeedModel feedModel;

  const PostDetail({Key? key, required this.feedModel}) : super(key: key);

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  final FeedController feedController = Get.put(FeedController());
  String? _selectedChoice;

  void _vote(String choice) {
    setState(() {
      _selectedChoice = choice;
    });
    feedController.vote(widget.feedModel.id, choice);
  }

  @override
  Widget build(BuildContext context) {
    final String title = widget.feedModel.title;
    final String content = widget.feedModel.content;
    final String choiceAText = widget.feedModel.firstOption;
    final String choiceBText = widget.feedModel.secondOption;
    final String? imageAPath =
        widget.feedModel.imageId != null ? widget.feedModel.imageUrl : null;
    final String? imageBPath =
        widget.feedModel.imageId != null ? widget.feedModel.imageUrl : null;
    final bool isMe = widget.feedModel.isMe;
    // 키워드 리스트를 가져옴
    final List<String> keywords = widget.feedModel.keywords;

    return Scaffold(
      appBar: BackAppBar(),
      body: Container(
        color: Colors.white, // 배경색
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 40,
                ),
                child: Column(
                  children: [
                    // 프로필 섹션
                    ProfileSection(isMe: isMe), // 사용자 게시물 여부 전달
                    SizedBox(height: 10),
                    Divider(color: Color(0xffD9D9D9)),

                    // 고민 내용(제목, 내용) 섹션
                    ContentSection(
                      title: title,
                      content: content,
                    ),

                    const Divider(color: Color(0xffD9D9D9)),

                    // 선택 항목 섹션(2가지)
                    // A 섹션
                    GestureDetector(
                      onTap: () => _vote('A'),
                      child: ChoicesSection(
                        choiceText: choiceAText,
                        imagePath: imageAPath,
                        backgroundColor: _selectedChoice == 'A'
                            ? Colors.grey.shade400
                            : const Color(0xffFF9B9B),
                        isSelected: _selectedChoice == 'A',
                      ),
                    ),

                    // VS Text
                    const Center(
                      child: Text(
                        'vs',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'NanumSquare_ac',
                          fontWeight: FontWeight.w800,
                          color: Color(0xff9B9B9B),
                        ),
                      ),
                    ),

                    // B 섹션
                    GestureDetector(
                      onTap: () => _vote('B'),
                      child: ChoicesSection(
                        choiceText: choiceBText,
                        imagePath: imageBPath,
                        backgroundColor: _selectedChoice == 'B'
                            ? Colors.grey.shade400
                            : const Color(0xff5DB1FF),
                        isSelected: _selectedChoice == 'B',
                      ),
                    ),

                    const SizedBox(height: 10),
                    const Divider(color: Color(0xffD9D9D9)),
                    const SizedBox(height: 10),

                    // 선택된 키워드 섹션 추가
                    if (keywords.isNotEmpty) // 키워드가 있을 경우만 표시
                      KeywordSection(keywords: keywords),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
