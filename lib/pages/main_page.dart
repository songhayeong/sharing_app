import 'package:fboe_app_writer/pages/mypage.dart';
import 'package:fboe_app_writer/pages/search_page.dart';
import 'package:fboe_app_writer/pages/sell_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            // const SizedBox(
            //   height: 30,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Column(
            //       children: const [
            //         MiddleButton(
            //           path: 'asset/image/icon1.png',
            //           value: 0xffdaca92,
            //         ),
            //         SizedBox(height: 5,),
            //         Text("아날로그",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            //       ],
            //     ),
            //     Column(
            //       children: const [
            //         MiddleButton(
            //           path: 'asset/image/icon2.png',
            //           value: 0xffd6e6fe,
            //         ),
            //         SizedBox(height: 5,),
            //         Text("디지털",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            //       ],
            //     ),
            //     Column(
            //       children: const [
            //         MiddleButton(
            //           path: 'asset/image/crown.png',
            //           value: 0xffffc989,
            //         ),
            //         SizedBox(height: 5,),
            //         Text("HOT/NEW",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            //       ],
            //     ),
            //     Column(
            //       children: const [
            //         MiddleButton(
            //           path: 'asset/image/Vector.png',
            //           value: 0xffe5ddbe,
            //         ),
            //         SizedBox(height: 5,),
            //         Text("GOODS",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            //       ],
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("이번주 최고 인기작품"),
                Text("실시간 급상승 작품"),
                Text("연인에게 사랑받는 작품"),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: const [
                  MiddleButton(
                    path: 'asset/image/my.png',
                    value: 0x0000000,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "내가 본 작품의 연관 작품",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
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
