import 'package:flutter/material.dart';

class CategoryDropButton extends StatefulWidget {
  const CategoryDropButton({Key? key}) : super(key: key);

  @override
  State<CategoryDropButton> createState() => _CategoryDropButtonState();
}

class _CategoryDropButtonState extends State<CategoryDropButton> {
  String dropdownValue = '아날로그';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items:
          <String>['아날로그', '디지털'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
    );
  }
}
