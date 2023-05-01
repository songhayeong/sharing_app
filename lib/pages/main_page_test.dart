import 'package:fboe_app_writer/pages/mypage.dart';
import 'package:fboe_app_writer/pages/search_page.dart';
import 'package:fboe_app_writer/pages/sell_page.dart';
import 'package:fboe_app_writer/provider/google_provider.dart';
import 'package:fboe_app_writer/provider/kakao_provider.dart';
import 'package:fboe_app_writer/provider/login_platform_provider.dart';
import 'package:fboe_app_writer/provider/naver_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_platform.dart';

class MainPageTest extends StatelessWidget {
  MainPageTest({Key? key}) : super(key: key);

  KakaoProvider? _kakaoProvider;
  GoogleProvider? _googleProvider;
  NaverProvider? _naverProvider;

  @override
  Widget build(BuildContext context) {
    _kakaoProvider = Provider.of<KakaoProvider>(context, listen: true);
    //_loginPlatformProvider =
    //  Provider.of<LoginPlatformProvider>(context, listen: false);
    _googleProvider = Provider.of<GoogleProvider>(context, listen: true);
    _naverProvider = Provider.of<NaverProvider>(context, listen: true);
    String? profileUrl;

    switch (LoginPlatformProvider.loginPlatform) {
      case LoginPlatform.google:
        // TODO: Handle this case.
        profileUrl = _googleProvider!.profileUrl;
        break;
      case LoginPlatform.kakao:
        // TODO: Handle this case.
        profileUrl =
            Provider.of<KakaoProvider>(context, listen: false).profileUrl;
        break;
      case LoginPlatform.apple:
        // TODO: Handle this case.
        break;
      case LoginPlatform.naver:
        profileUrl = _naverProvider!.profileUrl;
        // TODO: Handle this case.
        break;
      case LoginPlatform.none:
        //profileUrl = "";
        // TODO: Handle this case.
        break;
      case LoginPlatform.ourService:
        // TODO: Handle this case.
        break;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: false,
        title: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/main');
          },
          child: Image.asset(
            'asset/image/designer.png',
            fit: BoxFit.cover,
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/shopping_bag');
                },
                icon: const Icon(Icons.shopping_bag_outlined),
                color: Colors.black,
              ),
              Consumer<LoginPlatformProvider>(
                builder: (context, loginPlatform, child) {
                  return IconButton(
                    onPressed: () {
                      LoginPlatformProvider.loginPlatform == LoginPlatform.none
                          ? Navigator.pushNamed(context, '/login')
                          : //Scaffold.of(context).openEndDrawer(); 이거는 드로워 올라오는 것이지만 나는 내정보 페이지를 만드는중
                      Navigator.pushNamed(context, '/MyInfo');
                      // Provider.of<LoginPlatformProvider>(context, listen: false).loginPlatforms ==
                      //     LoginPlatform.none
                      // Navigator.pushNamed(context, '/login') : Scaffold.of(
                      //     context).openEndDrawer();
                    },
                    // icon: LoginPlatformProvider.loginPlatform !=
                    //     LoginPlatform.none
                    icon: LoginPlatformProvider.loginPlatform !=
                            LoginPlatform.none
                        ? Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.network(
                              profileUrl!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Icon(
                            Icons.person_outline,
                            color: Colors.black,
                          ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 300,
              width: 1100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/image/mainpage.png'),
                  fit: BoxFit.cover,
                  //fit: BoxFit.cover
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     GestureDetector(
            //       onTap: () {
            //         Navigator.pushNamed(context, '/analog');
            //       },
            //       child: Container(
            //         height: 100,
            //         width: 100,
            //         color: Colors.red,
            //         child: const Center(child: Text("아날로그")),
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 50,
            //     ),
            //     Container(
            //       height: 100,
            //       width: 100,
            //       color: Colors.blue,
            //       child: const Center(child: Text("디지털")),
            //     ),
            //   ],
            // ), 아날로그 삭제로 인한 주석처리
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "현재까지 N개의 작품이 등록되었어요!", // N개는 나중에 api에서 받아오기
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 45,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/negw');
                  },
                  child: const Text("더보기 >"),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              //이 부분은 인기작품인데 여기에는 나중에 키워드별이 들어갈 것.
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('asset/image/space.jpg'),
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('asset/image/ball.jpg'),
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('asset/image/puppy.jpg'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "인기작품",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 260,
                ),
                Text("더보기 >"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('asset/image/jeju.JPG'),
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('asset/image/hayeong.png'),
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('asset/image/back.png'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MiddleButton extends StatelessWidget {
  final int value;
  final String path;

  const MiddleButton({
    Key? key,
    required this.path,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(value),
        image: DecorationImage(
          image: AssetImage(path),
        ),
      ),
    );
  }
}
