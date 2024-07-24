import 'package:flutter/material.dart';

import '../../widgets/navigation/back_app_bar.dart';
import '../../widgets/sections/display/choices/choices_section.dart';
import '../../widgets/sections/display/content_section.dart';
import '../../widgets/sections/display/profile_section.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // 예시 데이터
    final String title = "WOWWOWWOW";
    final String content =
        "아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보";
    final String choiceAText = "선택 항목 A 텍스트";
    final String choiceBText = "선택 항목 B 텍스트";
    final String imageAPath = 'assets/images/jjanggu.jpg';
    final String imageBPath = 'assets/images/dog.jpg';

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
                    ProfileSection(),
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
                    ChoicesSection(
                      choiceText: choiceAText,
                      imagePath: imageAPath,
                      backgroundColor: const Color(0xffFF9B9B),
                    ),
                    // VS Text
                    const Center(
                      child: Text(
                        'vs',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff9B9B9B),
                        ),
                      ),
                    ),
                    // B 섹션
                    ChoicesSection(
                      choiceText: choiceBText,
                      imagePath: imageBPath,
                      backgroundColor: const Color(0xff5DB1FF),
                    ),
                    const SizedBox(height: 10),
                    const Divider(color: Color(0xffD9D9D9)),
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
