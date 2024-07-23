import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gomintapa/src/screens/my/mypage.dart';
import 'package:gomintapa/src/widgets/forms/label_textfield.dart';
import 'package:gomintapa/src/widgets/navigation/form_action_app_bar.dart';
import 'package:gomintapa/src/widgets/themes/auth_theme.dart';

import '../../controllers/auth_controller.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final authController = Get.find<AuthController>(); // 기존 인스턴스를 가져옴
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  // 기존 사용자 정보 로드
  void _loadInitialData() async {
    await authController.loadUserProfile();

    // 기존 데이터가 로드된 후에 필드에 설정
    _idController.text = authController.id;
    _nameController.text = authController.name;
    // 비밀번호와 비밀번호 확인 필드는 빈 상태로 유지 (사용자가 새로 입력해야 함)
  }

  // // 입력값 검증
  // bool _validateInputs() {
  //   // 닉네임 검증
  //   if (_nameController.text.isEmpty) {
  //     Get.snackbar('오류', '닉네임을 입력해주세요.');
  //     return false;
  //   }

  //   // 아이디 검증
  //   RegExp idRegex = RegExp(r'^[a-zA-Z0-9]{4,12}$');
  //   if (_idController.text.isEmpty) {
  //     Get.snackbar('오류', '아이디를 입력해주세요.');
  //     return false;
  //   } else if (!idRegex.hasMatch(_idController.text)) {
  //     Get.snackbar('오류', '아이디는 4~12자리의 알파벳과 숫자만 가능합니다.');
  //     return false;
  //   }

  //   // 비밀번호 검증
  //   RegExp passwordRegex = RegExp(
  //       r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
  //   if (_passwordController.text.isEmpty) {
  //     Get.snackbar('오류', '비밀번호를 입력해주세요.');
  //     return false;
  //   } else if (!passwordRegex.hasMatch(_passwordController.text)) {
  //     Get.snackbar('오류', '비밀번호는 최소 8자, 대문자, 소문자, 숫자, 특수문자를 포함해야 합니다.');
  //     return false;
  //   }

  //   // 비밀번호 확인 검증
  //   if (_passwordConfirmController.text.isEmpty) {
  //     Get.snackbar('오류', '비밀번호 확인을 입력해주세요.');
  //     return false;
  //   } else if (_passwordController.text != _passwordConfirmController.text) {
  //     Get.snackbar('오류', '비밀번호와 비밀번호 확인이 일치하지 않습니다.');
  //     return false;
  //   }
  //   return true;
  // }

  // 제출 버튼 클릭 시 호출되는 함수
  _submit() async {
    if (_validateInputs()) {
      // 사용자 정보를 업데이트하는 메서드 호출
      bool result = await authController.updateProfile(
        _idController.text,
        _passwordController.text,
        _nameController.text,
      );
      if (result) {
        Get.off(() => const MyPage());
      } else {
        Get.snackbar('오류', '프로필 업데이트에 실패했습니다.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AuthTheme.loginAndRegisterTheme,
      child: Scaffold(
        appBar: FormActionAppBar(
          onClose: () {
            // 닫기 버튼을 눌렀을 때의 동작
            Get.back();
          },
          onSubmit: () {
            // 제출 버튼을 눌렀을 때의 동작
            _submit();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 7),
          child: ListView(
            children: [
              const SizedBox(height: 22),
              Image.asset(
                'assets/images/gmtp_logo_big.png',
                width: 130,
                height: 130,
              ),
              const SizedBox(height: 24),
              LabelTextField(
                label: '닉네임',
                hintText: '닉네임을 입력해주세요.',
                keyboardType: TextInputType.text,
                controller: _nameController,
              ),
              LabelTextField(
                label: '아이디',
                hintText: '4~12자리의 숫자, 영문만 가능합니다.',
                keyboardType: TextInputType.text,
                controller: _idController,
              ),
              LabelTextField(
                label: '비밀번호',
                hintText: '4~12자리의 숫자, 영문만 가능합니다.',
                controller: _passwordController,
                isObscure: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
