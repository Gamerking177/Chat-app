import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:talksync/Controller/ProfileController.dart';
import 'package:talksync/Model/UserModel.dart';
import 'package:talksync/Pages/Home/HomePage.dart';
import 'package:uuid/uuid.dart';

class GroupController extends GetxController {
  RxList<UserModel> groupMembers = <UserModel>[].obs;
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  var uuid = Uuid();
  ProfileController profileController = Get.put(ProfileController());

  void selectMember(UserModel user) {
    if (groupMembers.contains(user)) {
      groupMembers.remove(user);
    } else {
      groupMembers.add(user);
    }
  }

  Future<void> createGroup(String groupName, String imagePath) async {
    isLoading.value = true;
    String groupId = uuid.v6();
    try {
      String imageUrl = await profileController.uploadFileToFirebase(imagePath);
      await db.collection("groups").doc(groupId).set(
        {
          "id": groupId,
          "name": groupName,
          "profileUrl": imageUrl,
          "members": groupMembers.map((e) => e.toJson()).toList(),
          "createdAt": DateTime.now().toString(),
          "createdBy": auth.currentUser!.uid,
          "timeStamp": DateTime.now().toString()
        },
      );
      // Group Created Tost
      Get.snackbar("Group Created", "Group Created Successfully");
      Get.offAll(HomePage());
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }
}
