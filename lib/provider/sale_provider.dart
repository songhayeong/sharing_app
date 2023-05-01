import 'dart:convert';
import 'package:flutter/material.dart';

class SaleProvider extends ChangeNotifier{
  TextEditingController workNameController = TextEditingController();
  TextEditingController workDescriptionController = TextEditingController();
  TextEditingController workPriceController = TextEditingController();
  TextEditingController hashtagController = TextEditingController();

  void register(String workName, workDescription, workPrice, hashtag) async {
    Map<String, dynamic> data = {
      'work_name': workName,
      'work_description': workDescription,
      'work_price': workPrice,
      'hashtag': hashtag,
    };
    String  jsonBody = jsonEncode(data);
  }
}