import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:talksync/Config/images.dart';
import 'package:talksync/Controller/ChatController.dart';
import 'package:talksync/Controller/ProfileController.dart';
import 'package:talksync/Model/UserModel.dart';
import 'package:talksync/Pages/Chat/Widgets/ChatBubble.dart';
import 'package:talksync/Pages/Chat/Widgets/TypeMessage.dart';
import 'package:talksync/Pages/UserProfile/ProfilePage.dart';

class ChatPage extends StatelessWidget {
  final UserModel userModel;
  const ChatPage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    ChatController chatController = Get.put(ChatController());
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.to(
              UserProfilePage(
                userModel: userModel,
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                imageUrl:
                    userModel.profileImage ?? AssetsImage.defaultProfileUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        ),
        title: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.to(
              UserProfilePage(
                userModel: userModel,
              ),
            );
          },
          child: Row(
            children: [
              Column(
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
            ],
          ),
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
      floatingActionButton: TypeMessage(
        userModel: userModel,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(bottom: 80, top: 10, left: 10, right: 10),
        child: StreamBuilder(
          stream: chatController.getMessages(userModel.id!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            }
            if (snapshot.data == null) {
              return Center(
                child: Text("No message"),
              );
            } else {
              return ListView.builder(
                reverse: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  DateTime timestamp =
                      DateTime.parse(snapshot.data![index].timestamp!);
                  String formattedTime =
                      DateFormat('hh:mm a').format(timestamp);
                  return ChatBubble(
                    message: snapshot.data![index].message!,
                    isComming: snapshot.data![index].receiverId ==
                        profileController.currentUser.value.id!,
                    time: formattedTime,
                    status: "read",
                    imageUrl: snapshot.data![index].imageUrl ?? "",
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
