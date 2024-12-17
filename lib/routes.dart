import 'package:flutter/material.dart';
import 'package:mencao/Views/Auth/loginView.dart';
import 'package:mencao/Views/Auth/registerView.dart';
import 'package:mencao/Views/Feed/chatView.dart';
import 'package:mencao/Views/Feed/createAdView.dart';
import 'package:mencao/Views/Feed/feedView.dart';
import 'package:mencao/Views/Profile/editProfileView.dart';
import 'package:mencao/Views/Profile/profileView.dart';

class AppRoutes {
  static const String login = '/';
  static const String register = '/register';
  static const String feed = '/feed';
  static const String chat = '/chat';
  static const String createAd = '/createAd';
  static const String profileScreen = '/profileScreen';
  static const String editProfileScreen = '/editProfileScreen';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => LoginScreen(),
      register: (context) => RegisterScreen(),
      feed: (context) => FeedScreen(),
      chat: (context) => ChatScreen(),
      createAd: (context) => CreateAdScreen(),
      profileScreen: (context) => ProfileScreen(),
      editProfileScreen: (context) => EditProfileScreen(),
    };
  }
}
