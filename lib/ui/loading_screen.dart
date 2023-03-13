import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  final String imageLogoName = "assets/images/designer.png";

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.384375),
                Container(
                  width: screenWidth * 0.616666,
                  height: screenHeight * 0.0859375,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(imageLogoName))),
                ),
                Expanded(child: SizedBox()),
                Align(
                  child: Text(
                    "Copyright 2023, 프보이",
                    style: TextStyle(
                      fontSize: screenWidth*(14/360),
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.0625,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
