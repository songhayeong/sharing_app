import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'package:fboe_app_writer/provider/login_platform_provider.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../login_platform.dart';
import '../model/data_model.dart';


class KakaoProvider extends ChangeNotifier{
  LoginPlatform loginPlatform = LoginPlatform.none;
  bool isKakaoLogined = false;
  String? profileUrl;
  String? kakaoEmail;
  String? nickname;
  String? name;
  int? id;
  OAuthToken? Token;
  var expiresTime;
  var refreshToken;
  LoginPlatformProvider? _loginPlatformProvider = LoginPlatformProvider();

  void signInWithKakao() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();

      OAuthToken token = isInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();

    LoginPlatformProvider.loginPlatform = LoginPlatform.kakao;

      final url = Uri.https('kapi.kakao.com', '/v2/user/me');
      final response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer${token.accessToken}'
        },
      );
      final profileInfo = jsonDecode(response.body);
      //print(profileInfo.toString());
      print('kakao accesstoken 값: ${token.accessToken}');
      Token = token.accessToken as OAuthToken;
      expiresTime = token.expiresAt;
      refreshToken = token.refreshToken;
      //loginPlatform = LoginPlatform.kakao;
    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');
    }

    try {
      User user = await UserApi.instance.me();
      isKakaoLogined = true;
      print('사용자 정보 요청 성공'
          '\n회원번호: ${user.id}'
          '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
          '\n이메일: ${user.kakaoAccount?.email}'
          '\n프로필사진: ${user.kakaoAccount?.profile?.profileImageUrl}');
      profileUrl = user.kakaoAccount?.profile?.profileImageUrl;
      nickname = user.kakaoAccount?.profile?.nickname;
      kakaoEmail = user.kakaoAccount?.email;
      name = user.kakaoAccount?.name;
      id = user.id;

      Map<String, dynamic> Oauth = {
        "_id":id,
        "oauth_name": "kakao",
        "access_token": Token,
        "account_email": kakaoEmail,
        "expires_at": expiresTime,
        "refresh_token": refreshToken
      };

      Map<String, dynamic> data = {
        'email': kakaoEmail,
        'hashed_password':"",
        'username': name,
        "oauth_accounts": Oauth,
        'picture': profileUrl,
      };

      var jsonBody = jsonEncode(data);

      //DataModel(kakaoEmail);
      // DataModel dataModel = DataModel(kakaoEmail);

       //dataModel.toJson();
      //
      // http.Response response = await http.post(
      //   Uri.parse('http://192.168.123.2:6500/data'),
      //   headers: {'Content-Type': 'application/json'},
      //   body: jsonBody);
      // if (response.statusCode >= 200 && response.statusCode >=300) {
      //   print('Data received and saved!');
      // } else {
      //   print('failed');
      //   print(response.body);
      // }
    } catch (error) {
      print('사용자 정보 요청 실패 $error');
    }
    notifyListeners();
  }

  void logOut() async {
    loginPlatform = LoginPlatform.none;
    notifyListeners();
  }
}