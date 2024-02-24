import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:talksync/Config/images.dart';
import 'package:talksync/Controller/ChatController.dart';
import 'package:talksync/Model/UserModel.dart';
import 'package:talksync/Pages/Chat/Widgets/ChatBubble.dart';

class ChatPage extends StatelessWidget {
  final UserModel userModel;
  const ChatPage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    TextEditingController messageController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Image.asset(AssetsImage.boyPic),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userModel.name ?? "user",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "Online",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.phone,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.video_call,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              AssetsImage.chatMicSvg,
              width: 25,
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                  filled: false,
                  hintText: "Type a message",
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                AssetsImage.chatGallarySvg,
                width: 25,
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {
                if (messageController.text.isNotEmpty) {
                  chatController.sendMessage(
                    userModel.id!,
                    messageController.text,
                  );
                  messageController.clear();
                }
              },
              child: Container(
                width: 30,
                height: 30,
                child: SvgPicture.asset(
                  AssetsImage.chatsendSvg,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ChatBubble(
              message: "Hii Aksh",
              imageUrl: "",
              isComming: true,
              time: "08:54 PM",
              status: "read",
            ),
            ChatBubble(
              message: "Hii Aksh",
              imageUrl: "",
              isComming: false,
              time: "08:45 PM",
              status: "read",
            ),
            ChatBubble(
              message: "Hii Aksh",
              imageUrl:
                  "https://images.unsplash.com/photo-1682686580391-615b1f28e5ee?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              isComming: true,
              time: "08:45 PM",
              status: "read",
            ),
          ],
        ),
      ),
    );
  }
}
