import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talksync/Config/images.dart';
import 'package:talksync/Pages/Home/Widgets/ChatTile.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InkWell(
          onTap: () {
            Get.toNamed("/chatPage");
          },
          child: ChatTile(
            imageUrl: AssetsImage.boyPic,
            name: "Raushan ",
            lastChat: "All the best 👍",
            lastTime: "09:48 PM",
          ),
        ),
        ChatTile(
          imageUrl: AssetsImage.girlPic,
          name: "Moni Dee",
          lastChat: "Raj kya kar rahe hoo",
          lastTime: "09:21 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.boyPic,
          name: "Ketan",
          lastChat: "are ka kar raha hai re tu",
          lastTime: "09:48 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.boyPic,
          name: "MR_DEVIL",
          lastChat: "ka kar raha hai re",
          lastTime: "09:48 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.girlPic,
          name: "Soni Dee",
          lastChat: "Raj video call karna",
          lastTime: "11:56 AM",
        ),
        ChatTile(
          imageUrl: AssetsImage.boyPic,
          name: "Shivam Cimage",
          lastChat: "Copy lete aana bhai",
          lastTime: "09:48 AM",
        ),
        ChatTile(
          imageUrl: AssetsImage.boyPic,
          name: "Srijan Cimage",
          lastChat: "bhai code send karna",
          lastTime: "12:56 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.girlPic,
          name: "Priya",
          lastChat: "All the best priya for exam",
          lastTime: "3:25 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.boyPic,
          name: "Himanshu 1",
          lastChat: "aa rah ahu bro",
          lastTime: "07:46 AM",
        ),
        ChatTile(
          imageUrl: AssetsImage.boyPic,
          name: "Himanshu 2",
          lastChat: "Himanshu kaha gya hai",
          lastTime: "08:34 AM",
        ),
        ChatTile(
          imageUrl: AssetsImage.girlPic,
          name: "Resham",
          lastChat: "Bhaiya kya kar rahe hai",
          lastTime: "09:48 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.girlPic,
          name: "Janu",
          lastChat: "Thank You Bhaiya",
          lastTime: "09:21 AM",
        ),
        ChatTile(
          imageUrl: AssetsImage.boyPic,
          name: "Aman ",
          lastChat: "Aksh kya kar raha hai bai",
          lastTime: "09:48 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.boyPic,
          name: "Avinash Cimage",
          lastChat: "Pahuch gya bhaii ??",
          lastTime: "10:48 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.boyPic,
          name: "Madav Cimage",
          lastChat: "Congratulations bhai",
          lastTime: "10:48 PM",
        ),
      ],
    );
  }
}
