import 'package:fboe_app_writer/components/my_drawer.dart';
import 'package:fboe_app_writer/login_platform.dart';
import 'package:fboe_app_writer/pages/main_page.dart';
import 'package:fboe_app_writer/pages/mypage.dart';
import 'package:fboe_app_writer/pages/search_page.dart';
import 'package:fboe_app_writer/pages/sell_page.dart';
import 'package:fboe_app_writer/provider/google_provider.dart';
import 'package:fboe_app_writer/provider/kakao_provider.dart';
import 'package:fboe_app_writer/provider/login_platform_provider.dart';
import 'package:fboe_app_writer/provider/naver_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import '../components/kakao_login_button.dart';
import '../provider/login_platform_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  bool _isLogined = false;
  static List<Widget> pages = <Widget>[
    const MainPage(),
    const SellPage(),
    SearchPage(),
    const MyPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  KakaoProvider? _kakaoProvider;
  GoogleProvider? _googleProvider;
  NaverProvider? _naverProvider;

  //LoginPlatformProvider? _loginPlatformProvider;

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
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: false,
        title: Image.asset(
          'asset/image/designer.png',
          fit: BoxFit.cover,
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/buy');
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.black,
                ),
              ),
              Consumer<LoginPlatformProvider>(
                builder: (context, loginPlatform, child) {
                  return IconButton(
                    onPressed: () {
                      LoginPlatformProvider.loginPlatform == LoginPlatform.none
                          ? Navigator.pushNamed(context, '/login')
                          : Scaffold.of(context).openEndDrawer();
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
                            Icons.person,
                            color: Colors.black,
                          ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      endDrawer: MyDrawer(),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        // selectedItemColor: Colors.black,
        // unselectedItemColor: Colors.black.withOpacity(60),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
              size: 40,
            ),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              color: Colors.black,
              size: 40,
            ),
            label: "작품",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 40,
            ),
            label: "검색",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,
              size: 40,
            ),
            label: "마이페이지",
          ),
        ],
      ),
    );
  }
}
