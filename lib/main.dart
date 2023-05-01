import 'package:fboe_app_writer/pages/buy_product_page.dart';
import 'package:fboe_app_writer/pages/category_page.dart';
import 'package:fboe_app_writer/pages/home.dart';
import 'package:fboe_app_writer/pages/login_page.dart';
import 'package:fboe_app_writer/pages/login_page_with_sns.dart';
import 'package:fboe_app_writer/pages/my_info_page.dart';
import 'package:fboe_app_writer/pages/new_product_page.dart';
import 'package:fboe_app_writer/pages/sell_page.dart';
import 'package:fboe_app_writer/pages/sell_sample_page.dart';
import 'package:fboe_app_writer/pages/sell_step_page.dart';
import 'package:fboe_app_writer/pages/shopping_bag_page.dart';
import 'package:fboe_app_writer/pages/signup_page.dart';
import 'package:fboe_app_writer/provider/category_form_provider.dart';
import 'package:fboe_app_writer/provider/google_provider.dart';
import 'package:fboe_app_writer/provider/kakao_provider.dart';
import 'package:fboe_app_writer/provider/login_platform_provider.dart';
import 'package:fboe_app_writer/provider/naver_provider.dart';
import 'package:fboe_app_writer/provider/sale_provider.dart';
import 'package:fboe_app_writer/provider/signout_provider.dart';
import 'package:fboe_app_writer/provider/step_manager_provider.dart';
import 'package:fboe_app_writer/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';
import 'package:fboe_app_writer/provider/image_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(nativeAppKey: '66a0b64c69cf7a0ce44267c041f74508'); //나도작가
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
        ChangeNotifierProvider(
            create: (BuildContext context) => ImageHandlingProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => SaleProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => StepManagerProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => FormProvider()),
      ],
      child: MaterialApp(
        title: 'Fboe Writer',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: const Home(),
        initialRoute: '/',
        routes: {
          '/buy': (context) => SellPage(),
          '/product': (context) => const BuyProductPage(),
          '/login': (context) => LoginPageWithSns(),
          '/main': (context) => const Home(),
          '/register': (context) => Signup(),
          '/loginEmail': (context) => LoginPage(),
          '/buytest': (context) => SellSamplePage(),
          '/new': (context) => NewProductPage(),
          '/analog': (context) => AnalogPage(),
          '/sellStep': (context) => SellStepPage(),
          '/MyInfo': (context) => MyInfoPage(),
          '/shopping_bag': (context) => ShoppingBagPage(),
        },
      ),
    );
  }
}
