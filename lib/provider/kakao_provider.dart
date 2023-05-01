import 'dart:convert';
import 'dart:io';
import 'package:fboe_app_writer/provider/login_platform_provider.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:http/http.dart' as http;
import '../login_platform.dart';
import '../model/user_model.dart';

class KakaoProvider extends ChangeNotifier {
  LoginPlatform loginPlatform = LoginPlatform.none;
  bool isKakaoLogined = false;
  String? profileUrl;
  String? kakaoEmail;
  String? nickname;
  String? name;
  int? id;
  var idToken;
  var expiresTime;
  var refreshToken;
  LoginPlatformProvider? _loginPlatformProvider = LoginPlatformProvider();

  void uriTestInKakao() async {
    try {
      final authCodeResponse =
          await AuthCodeClient.instance.authorize(
            redirectUri: 'kakao_login'
           // redirectUri: 'http://192.168.123.2:6700/kakao_login'
          );
      await _getAccessTokenAndUserInfo(authCodeResponse.toString());
    } catch (e) {
      print(e);
    }
  }

  Future<void> _getAccessTokenAndUserInfo(String code) async {
    try {
      final url_test =
      Uri.parse('http://192.168.123.2:6700/kakao_login?code=$code');
      final response = await http.get(
          url_test);
      if (response.statusCode == 200) {
        final accessToken = json.decode(response.body)['access_token'];
        //await AccessTokenStore.instance.toStore(accessToken);
        final User user = await UserApi.instance.me();
        print('User: $user');
      } else {
        throw Exception('Failed to get access token');
      }
    } catch (e) {
      print(e);
    }
  }

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
      print('kakao refreshtoken 값: ${token.refreshToken}');
      print('kakao idtoken 값: ${token.idToken}');
      idToken = token.idToken;
      final url_test =
          Uri.parse('http://127.0.0.1:8000/auth'); // fastapi인증되는지 확인하기 위한
      final headers_test = {'Authorization': 'Bearer $idToken'};
      final response_test = await http.post(url_test,
          headers: headers_test, body: {"id_token": jsonEncode(idToken)});
      if (response_test.statusCode == 200) {
        final responseData = json.decode(response_test.body);
        print(response_test.body);
      } else {
        print(response_test.statusCode);
      }
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
      //user.kakaoAccount?.phoneNumber;
      kakaoEmail = user.kakaoAccount?.email;
      name = user.kakaoAccount?.name;
      id = user.id;

      Map<String, dynamic> Oauth = {
        //"_id":id,
        "account_id": id,
        "oauth_name": "kakao",
        "access_token": idToken,
        "account_email": "/kakao",
        "expires_at": expiresTime,
        //"refresh_token": refreshToken
      };

      Map<String, dynamic> data = {
        'email': kakaoEmail,
        'hashed_password': "",
        'username': name,
        "oauth_accounts": [Oauth],
        'picture': profileUrl,
      };

      var jsonBody = jsonEncode(data);

      final isDuplicateUser =
          await DatabaseHelper.instance.isDuplicateUser(kakaoEmail!);
      if (isDuplicateUser) {
        print("사용자 중복");
      } else {
        final user = UserModel(email: kakaoEmail!);
        await DatabaseHelper.instance.insert(user);
        http.Response response = await http.post(
            Uri.parse('http://192.168.123.2:6500/data'),
            headers: {'Content-Type': 'application/json'},
            body: jsonBody);
        if (response.statusCode >= 200 && response.statusCode < 400) {
          print('Data received and saved!');
        } else {
          print('failed');
          print(response.body);
        }
      }
    } catch (error) {
      print('사용자 정보 요청 실패 $error');
    }
    notifyListeners();
  }

  void logOut() async {
    loginPlatform = LoginPlatform.none;
    notifyListeners();
  }

// void testing() async {
//   try {
//     print(Token);
//     http.Response response = await http.get(
//         Uri.parse('http://192.168.123.2:6500/who'),
//         headers: {'Authorization': 'Bearer $Token'});
//     print(response.body);
//   } catch (e) {
//     print(e.toString());
//   }
//   notifyListeners();
// }
}
