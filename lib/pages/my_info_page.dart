import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

const List<String> list = <String>['개인정보', '구매내역', '상점관리'];

class MyInfoPage extends StatefulWidget {
  const MyInfoPage({Key? key}) : super(key: key);

  @override
  State<MyInfoPage> createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> with TickerProviderStateMixin {
  late TabController tabController;
  UserProvider? _userProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  PreferredSizeWidget _tabMenu() {
    return TabBar(
      indicatorWeight: 1,
      controller: tabController,
      tabs: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              "개인정보",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              "구매내역",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              "상점관리",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _userProvider = Provider.of<UserProvider>(context, listen: false);

    Widget privacyView() {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.red,
            ),
            TextFormField(
              controller: _userProvider!.emailUpdateController,
              decoration: const InputDecoration(
                hintText: '여기에 원본 이메일 받아오기? 혹으 이메일 수정 할 것 넣기',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _userProvider!.usernameController,
              decoration: const InputDecoration(
                hintText: '여기는 서버에서 사용자의 이름을 받아와서 띄우게 하자'
              ),
              //여려 생년월일, 전화번호, 계좌설정, 알림설정 까지 설정할 수 있게 구현해야함
            ),
          ],
        ),
      );
    }

    Widget purchaseHistoryView() {
      return SingleChildScrollView(
        child: Text("구매내역"),
      );
    }

    Widget storeManagementView() {
      return SingleChildScrollView(
        child: Text("상점관리"),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "내 정보",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        bottom: _tabMenu(),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          privacyView(),
          purchaseHistoryView(),
          storeManagementView(),
        ],
      ),
    );
  }
}
