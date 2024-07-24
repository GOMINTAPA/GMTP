import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gomintapa/src/controllers/user_controller.dart';
import 'package:gomintapa/src/models/user_model.dart';
import 'package:gomintapa/src/widgets/buttons/logout.button.dart';
import 'package:gomintapa/src/widgets/navigation/back_app_bar.dart';
import 'package:gomintapa/src/widgets/sections/my/bottom_section.dart';
import 'package:gomintapa/src/widgets/sections/my/concern_feed_section.dart';
import 'package:gomintapa/src/widgets/sections/my/user_section.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  void initState() {
    super.initState();
    final userController = Get.find<UserController>();
    userController.myInfo(); // 사용자 정보 로드 호출
  }

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BackAppBar(),
      body: Column(
        children: [
          // 계정 정보 영역
          //UserSection(UserModel(id: 1, name: '노는게젤조아')),
          Obx(
            () {
              if (userController.my.value == null) {
                return const CircularProgressIndicator();
              } else {
                return UserSection(userController.my.value!);
              }
            },
          ),
          const SizedBox(height: 25),
          // 고민 정보 영역
          const Expanded(
            child: ConcernFeedSection(),
          ),
          // 하단 고정 영역
          BottomSection(
            buttonWidget: LogoutButton(
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
