import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:talksync/Config/Strings.dart';
import 'package:talksync/Config/images.dart';
import 'package:talksync/Controller/ImagePicker.dart';
import 'package:talksync/Controller/ProfileController.dart';
import 'package:talksync/Pages/Home/Widgets/ChatsList.dart';
import 'package:talksync/Pages/Home/Widgets/TabBar.dart';
import 'package:talksync/Pages/ProfilePage/ProfilePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    ProfileController profileController = Get.put(ProfileController());
    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          AppStrings.appName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            AssetsImage.appIconSVG,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              imagePickerController.pickImage();
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () async {
              // Get.toNamed("/profilePage");
              await profileController.getUserDetails();
              Get.to(ProfilePage());
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
        bottom: myTabBar(tabController, context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/contactPage");
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: TabBarView(
          controller: tabController,
          children: [
            ChatList(),
            ListView(
              children: [
                ListTile(
                  title: Text("Name Aksh"),
                ),
              ],
            ),
            ListView(
              children: [
                ListTile(
                  title: Text("Name Aksh"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
