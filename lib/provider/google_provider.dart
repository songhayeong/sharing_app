import 'package:fboe_app_writer/login_platform.dart';
import 'package:fboe_app_writer/provider/kakao_provider.dart';
import 'package:fboe_app_writer/provider/login_platform_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';

class GoogleProvider extends ChangeNotifier {
  LoginPlatform loginPlatform = LoginPlatform.none;
  String? name;
  String? email;
  String? id;
  String? token;
  String? profileUrl;

  void signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      LoginPlatformProvider.loginPlatform = LoginPlatform.google;
      print('name = ${googleUser!.displayName}');
      print('email = ${googleUser.email}');
      print('id = ${googleUser.id}');
      profileUrl = googleUser.photoUrl;
      name = googleUser.displayName;
      email = googleUser.email;
      id = googleUser.id;
    loginPlatform = LoginPlatform.google;
    GoogleSignIn().signIn().then((result){
      result!.authentication.then((googleKey){
        print(googleKey.accessToken);
        token = googleKey.accessToken;
        print(googleKey.idToken);
        //print(GoogleSignIn.currentUser.displayName);
      }).catchError((err){
        print('inner error');
      });
    }).catchError((err){
      print('error occured');
    });
    notifyListeners();
  }
  void signOut() async {
    loginPlatform = LoginPlatform.none;
    notifyListeners();
  }
}