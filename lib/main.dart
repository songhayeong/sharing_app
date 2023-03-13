import 'package:fboe_app_writer/pages/buy_product_page.dart';
import 'package:fboe_app_writer/pages/home.dart';
import 'package:fboe_app_writer/pages/login_page.dart';
import 'package:fboe_app_writer/pages/login_page_with_sns.dart';
import 'package:fboe_app_writer/pages/main_page.dart';
import 'package:fboe_app_writer/pages/sell_page.dart';
import 'package:fboe_app_writer/pages/signup_page.dart';
import 'package:fboe_app_writer/provider/google_provider.dart';
import 'package:fboe_app_writer/provider/kakao_provider.dart';
import 'package:fboe_app_writer/provider/login_platform_provider.dart';
import 'package:fboe_app_writer/provider/naver_provider.dart';
import 'package:fboe_app_writer/provider/signout_provider.dart';
import 'package:fboe_app_writer/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(nativeAppKey: '66a0b64c69cf7a0ce44267c041f74508');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => KakaoProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => SignoutProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => GoogleProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => LoginPlatformProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => UserProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => NaverProvider()),
      ],
      child: MaterialApp(
        title: 'Fboe Writer',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: const Home(),
        initialRoute: '/',
        routes: {
          '/buy': (context) => const SellPage(),
          '/product': (context) => const BuyProductPage(),
          '/login': (context) => LoginPageWithSns(),
          '/main': (context) => const Home(),
          '/register': (context) => Signup(),
          '/loginEmail': (context) => LoginPage(),
        },
      ),
    );
  }
}
