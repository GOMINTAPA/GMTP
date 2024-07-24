import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gomintapa/src/screens/auth/login.dart';
import 'package:gomintapa/src/widgets/themes/auth_theme.dart';
import 'package:gomintapa/src/widgets/forms/input/label_textfield.dart';

import '../../controllers/auth_controller.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final authController = Get.put(AuthController());
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _nameController = TextEditingController();

  _submit() async {
    bool result = await authController.register(
      _idController.text,
      _passwordController.text,
      _nameController.text,
    );
    if (result) {
      Get.off(() => const Login());
    }
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
              const SizedBox(height: 47),
              Text(
                '회원가입',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.50,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                // 회원가입과 아이디 사이 구분선
                width: 320,
                height: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFF9A9A9A),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              LabelTextField(
                label: '아이디',
                hintText: '4~12자리의 숫자, 영문만 가능합니다.',
                keyboardType: TextInputType.text,
                controller: _idController,
              ),
              LabelTextField(
                label: '닉네임',
                hintText: '닉네임을 입력해주세요.',
                keyboardType: TextInputType.text,
                controller: _nameController,
              ),
              LabelTextField(
                label: '비밀번호',
                hintText: '4~12자리의 숫자, 영문만 가능합니다.',
                controller: _passwordController,
                keyboardType: TextInputType.text,
                isObscure: true,
              ),
              LabelTextField(
                label: '비밀번호 확인',
                hintText: '비밀번호를 한번 더 입력해주세요.',
                controller: _passwordConfirmController,
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
                child: const Text('가입하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
