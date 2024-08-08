import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gomintapa/src/controllers/user_controller.dart';
import 'package:gomintapa/src/widgets/forms/input/label_textfield.dart';
import 'package:gomintapa/src/widgets/themes/auth_theme.dart';

class MypageEdit extends StatefulWidget {
  const MypageEdit({super.key});

  @override
  State<MypageEdit> createState() => _MypageEditState();
}

class _MypageEditState extends State<MypageEdit> {
  final userController = Get.put(UserController());
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  _submit() async {
    bool result = await userController.updateInfo(
        _idController.text, _nameController.text, _passwordController.text);
    if (result) {
      Get.back();
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = userController.my.value!.name;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AuthTheme.loginAndRegisterTheme,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 7),
          child: ListView(
            children: [
              const SizedBox(height: 22),
              Padding(
                padding:
                    const EdgeInsets.only(left: 156), // 이미지 왼쪽에 156픽셀 패딩 추가
                child: Image.asset(
                  'assets/images/gomintapa_logo.png',
                  width: 130,
                  height: 130,
                ),
              ),
              const SizedBox(height: 24),
              LabelTextField(
                label: '아이디',
                hintText: '바꾸실 아이디를 입력해주세요.',
                keyboardType: TextInputType.text,
                controller: _idController,
              ),
              LabelTextField(
                label: '닉네임',
                hintText: '바꾸실 닉네임을 입력해주세요.',
                keyboardType: TextInputType.text,
                controller: _nameController,
              ),
              LabelTextField(
                label: '비밀번호',
                hintText: '바꾸실 비밀번호를 입력해주세요.',
                controller: _passwordController,
                keyboardType: TextInputType.text,
                isObscure: true,
              ),
              const SizedBox(height: 108),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3C3C3C),
                  foregroundColor: Colors.white,
                ),
                onPressed: _submit,
                child: const Text('수정하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
