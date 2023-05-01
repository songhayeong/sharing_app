import 'package:flutter/material.dart';

class FirstStepWidget extends StatelessWidget {
  const FirstStepWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(labelText: '이름'),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: '이메일'),
        ),
      ],
    );
  }
}

class SecondStepWidget extends StatelessWidget {
  const SecondStepWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(labelText: '비밀번호'),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: '비밀번호 확인'),
        ),
      ],
    );
  }
}
