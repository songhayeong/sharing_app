import 'package:fboe_app_writer/login_platform.dart';
import 'package:flutter/material.dart';

class LoginPlatformProvider extends ChangeNotifier{
  static LoginPlatform loginPlatform = LoginPlatform.none;


  void signOut() {
    switch (LoginPlatformProvider.loginPlatform) {
      case LoginPlatform.google:
      // TODO: Handle this case.
        LoginPlatformProvider.loginPlatform = LoginPlatform.none;
        break;
      case LoginPlatform.kakao:
      // TODO: Handle this case.
        LoginPlatformProvider.loginPlatform = LoginPlatform.none;
        break;
      case LoginPlatform.apple:
      // TODO: Handle this case.
        LoginPlatformProvider.loginPlatform = LoginPlatform.none;
        break;
      case LoginPlatform.naver:
      // TODO: Handle this case.
        LoginPlatformProvider.loginPlatform = LoginPlatform.none;
        break;
      case LoginPlatform.ourService:
      // TODO: Handle this case.
        break;
      case LoginPlatform.none:
        LoginPlatformProvider.loginPlatform = LoginPlatform.none;
        // TODO: Handle this case.
        break;
    }
    notifyListeners();
  }


  LoginPlatform _loginPlatform = LoginPlatform.none;
  LoginPlatform get loginPlatforms =>  _loginPlatform;
  void set(LoginPlatform loginTest){
    _loginPlatform = loginTest;
    notifyListeners();
  }
}