import 'package:flutter/material.dart';

import '../../widgets/navigation/back_app_bar.dart';

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
              SizedBox(height: 20),
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
                    Divider(color: Color(0xffD9D9D9)),
                    // 선택 항목 섹션(2가지)
                    // A 섹션
                    ChoicesSection(
                      choiceText: choiceAText,
                      imagePath: imageAPath,
                      backgroundColor: Color(0xffFF9B9B),
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
                      backgroundColor: Color(0xff5DB1FF),
                    ),
                    SizedBox(height: 10),
                    Divider(color: Color(0xffD9D9D9)),
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

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        // 프로필 이미지
        Image(
          image: AssetImage('assets/images/default_profile.png'), // 이미지 경로 지정
          width: 48, // 너비
          height: 48, // 높이
          fit: BoxFit.cover, // 이미지 맞춤 형태
          alignment: Alignment.center, // 이미지 가운데 정렬
        ),
        SizedBox(width: 20), // 이미지와 닉네임 사이 간격
        // 사용자 이름
        Text(
          'username', // 실제 사용자 이름으로 대체
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class ContentSection extends StatelessWidget {
  final String title;
  final String content;

  const ContentSection({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class ChoicesSection extends StatelessWidget {
  final String choiceText;
  final String imagePath;
  final Color backgroundColor;

  const ChoicesSection({
    Key? key,
    required this.choiceText,
    required this.imagePath,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          PhotoDisplay(imagePath: imagePath),
          TextDisplay(
            backgroundColor: backgroundColor,
            choiceText: choiceText,
          ),
        ],
      ),
    );
  }
}

class PhotoDisplay extends StatelessWidget {
  final String imagePath;

  const PhotoDisplay({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: const Color(0xff9B9B9B), width: 1),
      ),
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
      ),
    );
  }
}

class TextDisplay extends StatelessWidget {
  final Color backgroundColor;
  final String choiceText;

  const TextDisplay({
    Key? key,
    required this.backgroundColor,
    required this.choiceText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: backgroundColor,
        border: const Border(
          bottom: BorderSide(
            color: Color(0xff9B9B9B),
            width: 1,
          ),
          left: BorderSide(
            color: Color(0xff9B9B9B),
            width: 1,
          ),
          right: BorderSide(
            color: Color(0xff9B9B9B),
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: Text(
          choiceText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
