import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talksync/Config/images.dart';
import 'package:talksync/Controller/GroupController.dart';
import 'package:talksync/Pages/GroupChat/GroupChat.dart';
import 'package:talksync/Pages/Home/Widgets/ChatTile.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.put(GroupController());
    return Obx(
      () => ListView(
        children: groupController.groupList
            .map(
              (group) => InkWell(
                onTap: () {
                  Get.to(GroupChatPage(groupModel: group));
                },
                child: ChatTile(
                  name: group.name!,
                  imageUrl: group.profileUrl == ""
                      ? AssetsImage.defaultProfileUrl
                      : group.profileUrl!,
                  lastChat: "lastChat",
                  lastTime: "lastTime",
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
