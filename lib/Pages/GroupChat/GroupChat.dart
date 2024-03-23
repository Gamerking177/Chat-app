import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:talksync/Config/images.dart';
import 'package:talksync/Controller/GroupController.dart';
import 'package:talksync/Controller/ProfileController.dart';
import 'package:talksync/Model/GroupModel.dart';
import 'package:talksync/Pages/Chat/Widgets/ChatBubble.dart';
import 'package:talksync/Pages/GroupChat/GroupTypeMessage.dart';
import 'package:talksync/Pages/GroupInfo/GroupInfo.dart';

class GroupChatPage extends StatelessWidget {
  final GroupModel groupModel;
  const GroupChatPage({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    GroupController groupController = Get.put(GroupController());
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          // onTap: () {
          //   Get.to(
          //     UserProfilePage(
          //       userModel: userModel,
          //     ),
          //   );
          // },
          child: Padding(
            padding: EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                imageUrl: groupModel.profileUrl == ""
                    ? AssetsImage.defaultProfileUrl
                    : groupModel.profileUrl!,
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
            Get.to(GroupInfo(
              groupModel: groupModel,
            ));
          },
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    groupModel.name ?? "Group",
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
      body: Padding(
        padding:
            const EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  StreamBuilder(
                    stream: groupController.getGroupMessage(groupModel.id!),
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
                            DateTime timestamp = DateTime.parse(
                                snapshot.data![index].timestamp!);
                            String formattedTime =
                                DateFormat('hh:mm a').format(timestamp);
                            return ChatBubble(
                              message: snapshot.data![index].message!,
                              isComming: snapshot.data![index].senderId !=
                                  profileController.currentUser.value.id,
                              time: formattedTime,
                              status: "read",
                              imageUrl: snapshot.data![index].imageUrl ?? "",
                            );
                          },
                        );
                      }
                    },
                  ),
                  Obx(
                    () => (groupController.selectedImagePath.value != "")
                        ? Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: FileImage(
                                          File(
                                            groupController
                                                .selectedImagePath.value,
                                          ),
                                        ),
                                        fit: BoxFit.contain),
                                    borderRadius: BorderRadius.circular(15),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                                  height: 400,
                                ),
                                Positioned(
                                  right: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      groupController.selectedImagePath.value =
                                          "";
                                    },
                                    icon: Icon(Icons.close),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
            GroupTypeMessage(
              groupModel: groupModel,
            ),
          ],
        ),
      ),
    );
  }
}
