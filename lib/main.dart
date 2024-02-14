import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talksync/Config/PagePath.dart';
import 'package:talksync/Config/Theme.dart';
import 'package:talksync/Pages/Home/HomePage.dart';
import 'package:talksync/Pages/Profile/ProfilePage.dart';
import 'package:talksync/Pages/SpalcePage/Splacepage.dart';
import 'package:talksync/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TalkSync',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      getPages: pagePath,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: ProfilePage(),
    );
  }
}
