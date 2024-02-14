import 'package:get/get.dart';
import 'package:talksync/Pages/Auth/AuthPage.dart';
import 'package:talksync/Pages/Chat/ChatPage.dart';
import 'package:talksync/Pages/Home/HomePage.dart';
import 'package:talksync/Pages/Profile/ProfilePage.dart';
import 'package:talksync/Pages/Profile/UpdateProfile.dart';

var pagePath = [
  GetPage(
    name: "/authPage",
    page: () => AuthPage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/homePage",
    page: () => HomePage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/chatPage",
    page: () => ChatPage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/profilePage",
    page: () => ProfilePage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/updateProfilePage",
    page: () => UpdateProfile(),
    transition: Transition.rightToLeft,
  ),
];
