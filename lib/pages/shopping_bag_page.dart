import 'package:flutter/material.dart';

const List<String> list = <String>['일반구매', '찜한상품'];

List<Map<String, dynamic>> data = [
  {
    'image': 'asset/image/jeju.JPG',
    'text': 'Jeju hayeong',
  },
  {
    'image': 'asset/image/space.jpg',
    'text': 'Space explorer',
  },
  {
    'image': 'asset/image/my.png',
    'text': 'My huge back',
  }
];

class ShoppingBagPage extends StatefulWidget {
  const ShoppingBagPage({Key? key}) : super(key: key);

  @override
  State<ShoppingBagPage> createState() => _ShoppingBagPageState();
}

class _ShoppingBagPageState extends State<ShoppingBagPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
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
              "일반구매",
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
              "찜한상품",
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

  Widget _generalPurchaseView() {
    return const SingleChildScrollView(
      child: Center(
        child: Text("일반구매"),
      ),
    );
  }

  Widget _favoriteProductView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("당신이 원하는 작품"),
                    Text("이것의 가격은 얼마일까요?"),
                    Text("style만 적용해주면 best of best 에요!"),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              listviewSeparated(),
            ],
          ),
        ],
      ),
    );
  }

  Widget listviewSeparated() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image(image: AssetImage('${data[index]['image']}')), //image
          title: Text(data[index]['text']),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: data.length,
      shrinkWrap: true, //shrinkWrap 속성은 listview나 GridView 같은 스크롤 가능한 위젯
      //해당 위젯이 스크롤 가능한 영역 내에서만 공간을 차지하도록 크기를 줄입니다.
      //true로 설정하는 것은 스크롤 가능한 위젯의 크기가 유동적이고 그 크기를 미리 알 수 없는 경우 유용.
      //이 속성을 사용하면 위젯이 자식 위젯의 측정 된 크기에 맞춰져서 렌더링 됩니다.
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "당신이 가지고 싶어하는 상품들",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        bottom: _tabMenu(),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          _generalPurchaseView(),
          _favoriteProductView(),
        ],
      ),
    );
  }
}
