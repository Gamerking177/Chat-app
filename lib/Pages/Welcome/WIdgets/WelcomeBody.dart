import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talksync/Config/Strings.dart';
import 'package:talksync/Config/images.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsImage.boyPic),
            SvgPicture.asset(AssetsImage.connectSVG),
            Image.asset(AssetsImage.girlPic),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          WelcomePageString.nowYouAre,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          WelcomePageString.connected,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          WelcomePageString.description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
