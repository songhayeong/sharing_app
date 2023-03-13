import 'package:flutter/material.dart';

class SellPage extends StatelessWidget {
  const SellPage({Key? key}) : super(key: key);

  void onSave(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Text(
          "나만의 개성을 세상에 알려보세요!",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          TextButton(
            onPressed: onSave,
            child: const Text("임시저장"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 30,
                ),
                Text(
                  "작품명",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                Container(
                  width: 240,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: const Color(0xFFFFC909), width: 2),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "작품명을 기입해주세요!",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  width: 105,
                  height: 45,
                  //margin: const EdgeInsets.all(0),
                  //padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFFFFC909), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "아날로그",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      Icon(Icons.arrow_drop_down_sharp),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 30,
                ),
                Text(
                  "작품 설명",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Container(
                width: 360,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffffc909),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "작품에 대한 설명을 기입해주세요!",
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 350),
              child: Text(
                "0/100",
              ),
            ),
            Row(
              children: const [
                SizedBox(
                  width: 30,
                ),
                Text(
                  "가격",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                Container(
                  width: 360,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffffc909),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "100,000",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                        Text(
                          "원",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "         최소 금액 1,000원 이상으로 입력해주세오",
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 30,
                ),
                Text(
                  "느낌적인 느낌",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                Container(
                  width: 360,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffffc909),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "#귀여운 #아기자기한 #간단한",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 30,
                ),
                Text(
                  "작품 이미지",
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  "  (3/9)",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 140,
                    height: 140,
                    color: const Color(0xffd9d9d9),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        size: 40,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 140,
                    height: 140,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('asset/image/puppy.jpg'))),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 140,
                    height: 140,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('asset/image/hayeong.png'))),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 15,
                ),
                Text(
                  "* 무단 도용은 하시면 안돼요!",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 15,
                ),
                Text(
                  "* 이쁜 그림 및 사진 1장 이상 필수로 올려주세요!",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 100,
              width: 1000,
              color: const Color(0xffffc909),
              child: const Center(
                child: Text(
                  "세상에 알리기",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
