import 'package:flutter/material.dart';

class AnalogForm extends StatelessWidget {
  const AnalogForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: "아날로그 항목1",
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "아날로그 항목2"
          ),
        ),
      ],
    );
  }
}

class DigitalForm extends StatelessWidget {
  const DigitalForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: '디지털 항목1',
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: '디지털 항목2',
          ),
        ),
      ],
    );
  }
}

