import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:talksync/Config/images.dart';
import 'package:talksync/Controller/ContactController.dart';
import 'package:talksync/Pages/ContactPage/Widgets/ContactSearch.dart';
import 'package:talksync/Pages/ContactPage/Widgets/NewContactTile.dart';
import 'package:talksync/Pages/Home/Widgets/ChatTile.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isSearchEnable = false.obs;
    ConatctController conatctController = Get.put(ConatctController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Conatct",
        ),
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                isSearchEnable.value = !isSearchEnable.value;
              },
              icon: isSearchEnable.value
                  ? Icon(
                      Icons.close,
                    )
                  : Icon(
                      Icons.search,
                    ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Obx(
              () => isSearchEnable.value ? ContactSearch() : SizedBox(),
            ),
            SizedBox(height: 10),
            NewContactTile(
              btnName: "New Conatct",
              icon: Icons.person_add,
              ontap: () {},
            ),
            SizedBox(height: 10),
            NewContactTile(
              btnName: "New Group",
              icon: Icons.group,
              ontap: () {},
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Contacts on Talksync"),
              ],
            ),
            Obx(
              () => Column(
                children: conatctController.userList
                    .map(
                      (e) => InkWell(
                        onTap: () {
                          // Get.toNamed("/chatPage");
                        },
                        child: ChatTile(
                          imageUrl:
                              e.profileImage ?? AssetsImage.defaultProfileUrl,
                          name: e.name ?? "User",
                          lastChat: e.about ?? "Hey there",
                          lastTime: "",
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
