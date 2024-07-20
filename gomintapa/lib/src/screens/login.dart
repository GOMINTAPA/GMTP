import 'package:flutter/material.dart';
import 'package:gomintapa/src/widgets/forms/label_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 7),
        child: ListView(
          children: [
            LabelTextField(
              label: '아이디',
              hintText: '아이디를 입력해주세요.',
              keyboardType: TextInputType.phone,
              //controller: _phoneController,
            ),
            LabelTextField(
              label: '비밀번호',
              hintText: '비밀번호를 입력해주세요.',
              //controller: _passwordController,
              isObscure: true,
            ),
            const SizedBox(height: 108),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3C3C3C),
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: const Text('로그인'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color(0xFF3C3C3C),
              ),
              onPressed: () {},
              child: const Text('회원가입'),
            )
          ],
        ),
      ),
    );
  }
}
