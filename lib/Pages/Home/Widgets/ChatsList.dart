import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talksync/Config/images.dart';
import 'package:talksync/Controller/ContactController.dart';
import 'package:talksync/Pages/Chat/ChatPage.dart';
import 'package:talksync/Pages/Home/Widgets/ChatTile.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  // 22:42

  @override
  Widget build(BuildContext context) {
    ConatctController conatctController = Get.put(ConatctController());
    return RefreshIndicator(
      child: Obx(
        () => ListView(
          children: conatctController.chatRoomList
              .map(
                (e) => InkWell(
                  onTap: () {
                    Get.to(ChatPage(userModel: e.receiver!));
                  },
                  child: ChatTile(
                    imageUrl: e.receiver!.profileImage ??
                        AssetsImage.defaultProfileUrl,
                    name: e.receiver!.name ?? "User",
                    lastChat: e.lastMessage ?? "Last message",
                    lastTime: e.lastMessageTimestamp ?? "Last time",
                  ),
                ),
              )
              .toList(),
        ),
      ),
      onRefresh: () {
        conatctController.getChatRoomList();
        return Future.delayed(
          Duration(seconds: 1),
          () {
            return;
          },
        );
      },
    );
  }
}
