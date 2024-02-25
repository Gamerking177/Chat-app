import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talksync/Controller/AuthController.dart';
import 'package:talksync/Model/UserModel.dart';
import 'package:talksync/Config/images.dart';
import 'package:talksync/Pages/UserProfile/Widgets/UserInfo.dart';

class UserProfilePage extends StatelessWidget {
  final UserModel userModel;
  const UserProfilePage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("/updateProfilePage");
            },
            icon: Icon(
              Icons.edit,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            LoginUserInfo(
              profileImage:
                  userModel.profileImage ?? AssetsImage.defaultProfileUrl,
              usernName: userModel.name ?? "User",
              userEmail: userModel.email ?? "",
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
