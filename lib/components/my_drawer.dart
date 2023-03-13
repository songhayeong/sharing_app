import 'package:fboe_app_writer/login_platform.dart';
import 'package:fboe_app_writer/provider/google_provider.dart';
import 'package:fboe_app_writer/provider/kakao_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/login_platform_provider.dart';
import '../provider/naver_provider.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

  KakaoProvider? _kakaoProvider;
  NaverProvider? _naverProvider;
  GoogleProvider? _googleProvider;

  @override
  Widget build(BuildContext context) {
    _kakaoProvider = Provider.of<KakaoProvider>(context, listen: false);
    _naverProvider = Provider.of<NaverProvider>(context, listen: false);
    _googleProvider = Provider.of<GoogleProvider>(context, listen: false);

    String? email;
    String? name;
    String? profileUrl;

    switch (LoginPlatformProvider.loginPlatform) {
      case LoginPlatform.google:
        // TODO: Handle this case.
        profileUrl = _googleProvider!.profileUrl;
        email = _googleProvider!.email;
        name = _googleProvider!.name;
        break;
      case LoginPlatform.kakao:
        // TODO: Handle this case.
        profileUrl = _kakaoProvider!.profileUrl;
        email = _kakaoProvider!.kakaoEmail;
        name = _kakaoProvider!.nickname;
        break;
      case LoginPlatform.apple:
        // TODO: Handle this case.
        break;
      case LoginPlatform.naver:
        profileUrl = _naverProvider!.profileUrl;
        email = _naverProvider!.email;
        name = _naverProvider!.name;
        // TODO: Handle this case.
        break;
      case LoginPlatform.ourService:
        // TODO: Handle this case.
        break;
      case LoginPlatform.none:
        profileUrl = null;
        email = "fboe@example.com";
        name = "로그인 부탁드립니다!";
        // TODO: Handle this case.
        break;
    }

    void signOut() async {
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
          _naverProvider!.signOutWithNaver();
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
    }

    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(name!),
            accountEmail: Text(email!),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(profileUrl!),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Handle drawer item tap
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Handle drawer item tap
              Navigator.pop(context);
            },
          ),
          LoginPlatformProvider.loginPlatform != LoginPlatform.none
              ? ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Log Out'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("확인"),
                          content: const Text("정말 로그아웃 하시겠어요?"),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Provider.of<LoginPlatformProvider>(context, listen: false).signOut();
                                Navigator.pop(context);
                              },
                              child: const Text("네"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("아니오"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                )
              : ListTile(
                  leading: const Icon(Icons.login),
                  title: const Text('Please Login'),
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                )
        ],
      ),
    );
  }
}
