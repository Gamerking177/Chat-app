import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:talksync/Config/images.dart';
import 'package:talksync/Controller/ChatController.dart';
import 'package:talksync/Controller/GroupController.dart';
import 'package:talksync/Controller/ImagePicker.dart';
import 'package:talksync/Model/GroupModel.dart';
import 'package:talksync/Widgets/ImagePickerBottomSheet.dart';

class GroupTypeMessage extends StatelessWidget {
  final GroupModel groupModel;
  const GroupTypeMessage({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    TextEditingController messageController = TextEditingController();
    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());
    GroupController groupController = Get.put(GroupController());
    RxString message = "".obs;
    return Container(
      // margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            child: SvgPicture.asset(
              AssetsImage.chatEmoji,
              width: 25,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              onChanged: (value) {
                message.value = value;
              },
              controller: messageController,
              decoration: InputDecoration(
                filled: false,
                hintText: "Type a message",
              ),
            ),
          ),
          SizedBox(width: 10),
          Obx(
            () => chatController.selectedImagePath.value == ""
                ? InkWell(
                    onTap: () {
                      ImagePickerBottomSheet(
                          context, chatController, imagePickerController);
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      child: SvgPicture.asset(
                        AssetsImage.chatGallarySvg,
                        width: 25,
                      ),
                    ),
                  )
                : SizedBox(),
          ),
          SizedBox(width: 10),
          Obx(
            () => message.value != "" ||
                    chatController.selectedImagePath.value != ""
                ? InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      groupController.sendGroupMessage(
                        messageController.text,
                        groupModel.id!,
                        "",
                      );
                      messageController.clear();
                      message.value = "";
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      child: chatController.isLoading.value
                          ? CircularProgressIndicator()
                          : SvgPicture.asset(
                              AssetsImage.chatsendSvg,
                            ),
                    ),
                  )
                : Container(
                    width: 30,
                    height: 30,
                    child: SvgPicture.asset(
                      AssetsImage.chatMicSvg,
                      width: 25,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
