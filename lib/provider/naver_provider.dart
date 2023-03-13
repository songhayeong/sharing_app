import 'package:fboe_app_writer/login_platform.dart';
import 'package:fboe_app_writer/provider/login_platform_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';

class NaverProvider extends ChangeNotifier {
  late final NaverLoginResult result;
  NaverAccessToken? token;
  String? id;
  String? email;
  String? name;
  String? profileUrl;
  void signInWithNaver() async {
    result = await FlutterNaverLogin.logIn();

    LoginPlatformProvider.loginPlatform = LoginPlatform.naver;
    if (result.status == NaverLoginStatus.loggedIn) {
      print('accessToken = ${result.accessToken}');
      print('id = ${result.account.id}');
      print('email = ${result.account.email}');
      print('name = ${result.account.name}');
      token = result.accessToken;
      id = result.account.id;
      email = result.account.email;
      name = result.account.name;
      profileUrl = result.account.profileImage;
    }
    notifyListeners();
  }

  void signOutWithNaver() async {
   result = await FlutterNaverLogin.logOut();
  }
}
