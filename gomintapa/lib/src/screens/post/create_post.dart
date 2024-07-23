import 'package:flutter/material.dart';

import '../../widgets/navigation/form_action_app_bar.dart';
import '../../widgets/sections/post/choices_section.dart';
import '../../widgets/sections/post/input_section.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  // 제목과 내용을 저장할 컨트롤러
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _aInputController = TextEditingController();
  final TextEditingController _bInputController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _aInputController.dispose();
    _bInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 화면의 너비를 비율로 계산
    final double screenWidth = MediaQuery.of(context).size.width;
    final double containerWidth = screenWidth * 0.9; // 화면 너비의 90%로 설정

    return Scaffold(
      appBar: FormActionAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(0), // 전체 padding 제거
        children: [
          InputSection(
            titleController: _titleController,
            contentController: _contentController,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Divider(
              thickness: 1,
              color: Color(0xffA7A7A7),
              height: 0, // Divider 위아래의 공간 제거
            ),
          ),
          ChoicesSection(
            inputController: _aInputController,
            hintText: 'A 입력',
            backgroundColor: Color(0xffFF9B9B),
            containerWidth: containerWidth, // containerWidth 전달
          ),
          Container(
            color: Colors.white,
            child: const Text(
              'vs',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xff9B9B9B),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ChoicesSection(
            inputController: _bInputController,
            hintText: 'B 입력',
            backgroundColor: Color(0xff5DB1FF),
            containerWidth: containerWidth, // containerWidth 전달
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Divider(
              thickness: 1,
              color: Color(0xffA7A7A7),
              height: 0, // Divider 위아래의 공간 제거
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40), // 좌우 여백 추가
            child: SizedBox(
              width: double.infinity, // 가능한 모든 너비를 사용
              height: 50,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // 모서리 둥굴게 설정
                  ),
                  side: const BorderSide(
                    color: Color(0xff9B9B9B), // 버튼 테두리
                  ),
                ),
                child: const Text(
                  '키워드 선택',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff9B9B9B),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  void _submitPost() {
    final String title = _titleController.text;
    final String content = _contentController.text;
    final String aInput = _aInputController.text;
    final String bInput = _bInputController.text;

    // TODO: 제출 로직 구현 (예: 서버에 데이터 전송, 로컬 저장 등)

    // 예시로 데이터를 콘솔에 출력
    print('제목: $title');
    print('내용: $content');
    print('A 입력: $aInput');
    print('B 입력: $bInput');
  }
}
