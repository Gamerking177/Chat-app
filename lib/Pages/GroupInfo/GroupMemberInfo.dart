import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:talksync/Config/images.dart';
import 'package:talksync/Controller/GroupController.dart';
import 'package:talksync/Model/UserModel.dart';

class GroupMemberInfo extends StatelessWidget {
  final String profileImage;
  final String usernName;
  final String userEmail;
  final String groupId;
  const GroupMemberInfo(
      {super.key,
      required this.profileImage,
      required this.usernName,
      required this.userEmail,
      required this.groupId});

  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.put(GroupController());
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl: profileImage,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      usernName,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userEmail,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).colorScheme.background,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AssetsImage.profileAudioCall,
                            width: 25,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Call",
                            style: TextStyle(
                              color: Color(0xff039C00),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).colorScheme.background,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AssetsImage.profileVideoCall,
                            width: 25,
                            color: Color(0xffFF9900),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Video",
                            style: TextStyle(
                              color: Color(0xffFF9900),
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        var newMember = UserModel(
                          email: "rajaksh03@gmail.com",
                          name: "Aksh raj",
                          profileImage: "",
                          role: "Admin",
                        );
                        groupController.addMemberToGroup(groupId, newMember);
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).colorScheme.background,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AssetsImage.groupAddUser,
                              width: 25,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Add"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
