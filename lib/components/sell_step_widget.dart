import 'package:flutter/material.dart';

class FirstStepWidget extends StatelessWidget {
  const FirstStepWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(labelText: '항목1'),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: '항목2'),
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
          decoration: InputDecoration(labelText: '항목3'),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: '항목4'),
        ),
      ],
    );
  }
}
