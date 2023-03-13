import 'package:fboe_app_writer/components/google_login_button.dart';
import 'package:fboe_app_writer/components/kakao_login_button.dart';
import 'package:fboe_app_writer/provider/google_provider.dart';
import 'package:fboe_app_writer/provider/kakao_provider.dart';
import 'package:fboe_app_writer/provider/login_platform_provider.dart';
import 'package:fboe_app_writer/provider/naver_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import '../login_platform.dart';

class LoginPageWithSns extends StatelessWidget {
  LoginPageWithSns({Key? key}) : super(key: key);
  KakaoProvider? _kakaoProvider;
  GoogleProvider? _googleProvider;
  NaverProvider? _naverProvider;

  @override
  Widget build(BuildContext context) {
    _kakaoProvider = Provider.of<KakaoProvider>(context);
    _googleProvider = Provider.of<GoogleProvider>(context);
    _naverProvider = Provider.of<NaverProvider>(context);

    signIn() async {
      switch (LoginPlatformProvider.loginPlatform) {
        case LoginPlatform.google:
          // TODO: Handle this case.
          break;
        case LoginPlatform.kakao:
          // TODO: Handle this case.
          break;
        case LoginPlatform.apple:
          // TODO: Handle this case.
          break;
        case LoginPlatform.naver:
          // TODO: Handle this case.
          break;
        case LoginPlatform.ourService:
          // TODO: Handle this case.
          break;
        case LoginPlatform.none:
          // TODO: Handle this case.
          break;
      }
    }

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('asset/image/jeju.JPG'), fit: BoxFit.cover),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 400,
                  width: 200,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('asset/image/designer.png'))),
                ),
                Consumer(
                  builder: (context, provider, child) {
                    return GestureDetector(
                      onTap: () {
                        _kakaoProvider!.signInWithKakao();
                        if (Provider.of<KakaoProvider>(context, listen: false).profileUrl != null) {
                          Navigator.pushNamed(context, '/main');
                        } else {
                          print('login error'); // try - catch로 수정할 것 !!
                        }
                      },
                      child: Container(
                        width: 220,
                        height: 45,
                        decoration: const BoxDecoration(
                            color: Color(0xFFFEE500),
                            //borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image:
                                    AssetImage('asset/image/kakao_logo.png'))),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 0,
                ),
                SignInButton(
                  Buttons.Google,
                  text: 'Sign in with Google',
                  onPressed: () {
                    _googleProvider!.signInWithGoogle();
                  },
                ),
                GestureDetector(
                  onTap: () {
                    _naverProvider!.signInWithNaver();
                  },
                  child: Container(
                    width: 220,
                    height: 45,
                    decoration: const BoxDecoration(
                        color: Color(0xFF03C75A),
                        //borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage('asset/image/naver_login.png'))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text('회원가입하기'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    // Text('아이디 찾기'),
                    // SizedBox(width: 10,),
                    // Text('비밀번호 찾기'),
                    const Text('ID/PW 찾기'),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
