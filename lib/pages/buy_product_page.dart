import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuyProductPage extends StatelessWidget {
  const BuyProductPage({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      //floatingActionButton: const FloatingActionButton(onPressed: null,focusColor: Color(0xffffc909),),
      floatingActionButton: Align(
        alignment:
            Alignment(Alignment.bottomRight.x, Alignment.bottomRight.y - 0.13),
        child: const FloatingActionButton(
          backgroundColor: Color(0xffffc909),
          onPressed: null,
          child: Icon(Icons.comment),
          tooltip: '작품 문의',
        ),
      ),
      body: Column(
        children: [
          const Image(image: AssetImage('asset/image/my.png')),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("asset/image/hayeong.png"),
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "FBOE",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 35,
              ),
              Column(
                children: const [
                  Text(
                    "제주도를 품은 남자",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                "100,000원",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.share,
                size: 30,
              ),
              SizedBox(
                width: 30,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: const [
              SizedBox(
                width: 40,
              ),
              Text(
                "#풍경사진 #제주도풍경 #뒷모습 #인물사진",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 380,
            height: 50,
            color: const Color(0xfff3efde),
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "적립   100p",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 25,
              ),
              Container(
                width: 240,
                height: 140,
                color: const Color(0xfff3efde),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffffc909),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffffc909),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffffc909),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffffc909),
                        ),
                        Icon(
                          Icons.star_outline,
                          color: Color(0xffffc909),
                        ),
                      ],
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Text(
                        "멋있는 그림 감사합니다. 너무 맘에 들어요! 어플 번창하세요!",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    const Text(
                      "Hwanichu님",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 150,
                height: 140,
                child: Column(
                  children: [
                    Icon(
                      Icons.arrow_forward_sharp,
                      size: 80,
                    ),
                    Text(
                      "더보기",
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                          size: 60,
                        ),
                        Text("115"),
                      ],
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.card_giftcard,
                          size: 60,
                        ),
                        Text("선물하기"),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 170,
                      height: 65,
                      color: Color(0xffffc909),
                      child: Center(
                        child: Text(
                          "구매하기",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
