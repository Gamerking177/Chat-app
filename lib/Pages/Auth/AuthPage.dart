import 'package:flutter/material.dart';
import 'package:talksync/Pages/Auth/Widgets/AuthPageBody.dart';
import 'package:talksync/Pages/Welcome/WIdgets/WelcomeHeading.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                WelcomeHeading(),
                SizedBox(
                  height: 40,
                ),
                AuthPageBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
