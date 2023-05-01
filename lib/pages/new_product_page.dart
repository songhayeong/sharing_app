import 'package:flutter/material.dart';

class NewProductPage extends StatelessWidget {
  const NewProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "우리의 작품들",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("여기에 필터"),
                Text("여기에도 하나더"),
              ],
            ),
          ),
          Row(
            children: [
              Row(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.blue,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
