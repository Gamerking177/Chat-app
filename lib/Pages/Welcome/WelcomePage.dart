import 'package:flutter/material.dart';
import 'package:talksync/Pages/Welcome/WIdgets/WelcomeBody.dart';
import 'package:talksync/Pages/Welcome/WIdgets/WelcomeFooterButton.dart';
import 'package:talksync/Pages/Welcome/WIdgets/WelcomeHeading.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WelcomeHeading(),
              WelcomeBody(),
              WelcomeFooterButton(),
            ],
          ),
        ),
      ),
    );
  }
}
