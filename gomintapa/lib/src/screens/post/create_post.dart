import 'package:flutter/material.dart';

import '../../widgets/buttons/keyword_select_button.dart';
import '../../widgets/navigation/form_action_app_bar.dart';
import '../../widgets/sections/my/bottom_section.dart';
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

  // 공통 Divider를 변수로 정의
  final Widget commonDivider = const Padding(
    padding: EdgeInsets.symmetric(horizontal: 40),
    child: Divider(
      thickness: 1,
      color: Color(0xffA7A7A7),
      height: 0, // Divider 위아래의 공간 제거
    ),
  );

  @override
  void dispose() {
    // 컨트롤러 해제
    _titleController.dispose();
    _contentController.dispose();
    _aInputController.dispose();
    _bInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth =
        MediaQuery.of(context).size.width; // 화면의 너비를 비율로 계산
    final double containerWidth = screenWidth * 0.9; // 화면 너비의 90%로 설정

    return Scaffold(
      appBar: FormActionAppBar(),
      body: Container(
        color: Colors.white, // 화면 전체 배경색 흰색으로 설정
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 제목, 내용 입력 섹션
              InputSection(
                titleController: _titleController,
                contentController: _contentController,
              ),
              // 공통 Divider
              commonDivider,
              // A 입력 및 사진첨부 섹션
              ChoicesSection(
                inputController: _aInputController,
                hintText: 'A 입력',
                backgroundColor: const Color(0xffFF9B9B),
                containerWidth: containerWidth, // containerWidth 전달
              ),
              // VS Text
              const Center(
                child: Text(
                  'vs',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff9B9B9B),
                  ),
                ),
              ),
              // B 입력 및 사진 첨부 섹션
              ChoicesSection(
                inputController: _bInputController,
                hintText: 'B 입력',
                backgroundColor: const Color(0xff5DB1FF),
                containerWidth: containerWidth, // containerWidth 전달
              ),
              // 공통 Divider
              const SizedBox(height: 10),
              commonDivider,
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomSection(
        buttonWidget: KeywordSelectButton(
          onPressed: () {}, // 버튼 클릭 시 호출되는 메서드
        ),
      ),
    );
  }

  void _submitPost() {
    final String title = _titleController.text;
    final String content = _contentController.text;
    final String aInput = _aInputController.text;
    final String bInput = _bInputController.text;

    // TODO: 제출 로직 구현 (예: 서버에 데이터 전송, 로컬 저장 등)

    // 현재는 데이터 출력으로 대체
    print('제목: $title');
    print('내용: $content');
    print('A 입력: $aInput');
    print('B 입력: $bInput');
  }
}
