import 'package:flutter/material.dart';
import 'package:talksync/Config/images.dart';
import 'package:talksync/Pages/Home/Widgets/ChatTile.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatTile(
          imageUrl: AssetsImage.defaultProfileUrl,
          name: "Coader Team",
          lastChat: "lastChat",
          lastTime: "lastTime",
        )
      ],
    );
  }
}
