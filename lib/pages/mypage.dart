import 'package:fboe_app_writer/pages/main_page.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['인기순', '주문 많은 순', '리뷰 많은 순'];

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 40,
                  ),
                  child: ProfileImage(
                    imgPath: 'asset/image/my.png',
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "FBOE",
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          children: const [
                            Text("작품 찜",style: TextStyle(fontSize: 20),),
                            Text("37",style: TextStyle(fontSize: 30),),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          children: const [
                            Text("팔로워",style: TextStyle(fontSize: 20),),
                            Text("101",style: TextStyle(fontSize: 30),),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          children: const [
                            Text("작품 수",style: TextStyle(fontSize: 20),),
                            Text("14",style: TextStyle(fontSize: 30),),
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                SizedBox(width: 40,),
                Text("21세기의 개성에 정답은 존재하지 않습니다.",
                style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                Container(
                  width: 195,
                  height: 35,
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),color: const Color(0xFF75C4E0),),
                  child: const Center(child: Text("+ 팔로우")),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  width: 145,
                  height: 35,
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),color: Colors.grey),
                  child: Center(
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 50,
                        ),
                        Icon(Icons.share),
                        Text("공유"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            _tabMenu(),
            const SizedBox(
              height: 10,
            ),
            _feedView(),
          ],
        ),
      ),
    );
  }

  Widget _tabMenu() {
    return TabBar(
        indicatorColor: const Color(0xffffc909),
        indicatorWeight: 1,
        // unselectedLabelColor: Color(0xffEDE5CA),
        // unselectedLabelStyle: TextStyle(color: Colors.black),
        controller: tabController,
        tabs: [
          Container(
            child: const Center(child: Text("프로필")),
          ),
          Container(
            child: const Center(child: Text("피드")),
          ),
          Container(
            child: const Center(
              child: Text("구매후기"),
            ),
          )
        ]);
  }

  Widget _feedView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: const [
            SizedBox(width: 30,),
            DropdownfilterButton(),
          ],
        ),
        Row(
          children: const [
            SizedBox(width: 30,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 1),
              child: Text("4개의 판매작품",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            DrawingInfoButton(path: "asset/image/puppy.jpg"),
            DrawingInfoButton(path: "asset/image/my.png"),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            DrawingInfoButton(path: "asset/image/space.jpg"),
            DrawingInfoButton(path: "asset/image/hayeong.png"),
          ],
        ),
      ],
    );
  }

  Widget _tabView() {
    return TabBarView(
      controller: tabController,
      children: [
        Container(
          child: const Center(
            child: Text("page1"),
          ),
        ),
        Container(
          child: const Center(
            child: Text("page2"),
          ),
        ),
        Container(
          child: const Center(
            child: Text("page3"),
          ),
        ),
      ],
    );
  }
}

class DropdownfilterButton extends StatefulWidget {
  const DropdownfilterButton({Key? key}) : super(key: key);

  @override
  State<DropdownfilterButton> createState() => _DropdownfilterButtonState();
}

class _DropdownfilterButtonState extends State<DropdownfilterButton> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 10,
      underline: Container(
        height: 2,
        color: const Color(0xffffc909),
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class ProfileImage extends StatelessWidget {
  final String imgPath;

  const ProfileImage({
    Key? key,
    required this.imgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(imgPath),
        ),
      ),
    );
  }
}

class DrawingInfoButton extends StatelessWidget {
  final String path;

  const DrawingInfoButton({
    Key? key,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
        width: 180,
        height: 160,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(path),
          ),
        ),
      ),
    );
  }
}
