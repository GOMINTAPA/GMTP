import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gomintapa/src/controllers/user_controller.dart';
import 'package:gomintapa/src/home.dart';
import 'package:get/get.dart';
import 'package:gomintapa/src/controllers/user_controller.dart';
import 'package:gomintapa/src/models/user_model.dart';
import 'package:gomintapa/src/screens/auth/login.dart';
import 'package:gomintapa/src/screens/shared/global.dart';
import 'package:gomintapa/src/widgets/buttons/logout.button.dart';
import 'package:gomintapa/src/widgets/navigation/back_app_bar.dart';
import 'package:gomintapa/src/widgets/sections/my/bottom_section.dart';
import 'package:gomintapa/src/widgets/sections/my/concern_feed_section.dart';
import 'package:gomintapa/src/widgets/sections/my/user_section.dart';

class Mypage extends StatelessWidget {
  const Mypage({super.key});

  @override
  Widget build(BuildContext context) {
    String? token = GetStorage().read('access_token');
    final userController = Get.put(UserController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BackAppBar(),
      body: Column(
        children: [
          // 계정 정보 영역
          //UserSection(UserModel(id: 1, name: '노는게젤조아')),
          Obx(() {
            if (userController.my.value == null) {
              return const CircularProgressIndicator();
            } else {
              return UserSection(userController.my.value!);
            }
          }),
          const SizedBox(height: 25),
          // 고민 정보 영역
          const Expanded(
            child: ConcernFeedSection(),
          ),
          // 하단 고정 영역
          BottomSection(
            buttonWidget: LogoutButton(
              onPressed: () {
                GetStorage().remove('access_token');
                if (GetStorage().read('access_token') == null) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/intro', (route) => false);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
