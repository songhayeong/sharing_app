import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';
import 'dart:convert';

class UserProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController infoController = TextEditingController();
  TextEditingController emailUpdateController = TextEditingController();
  void signup(String email, password) async {
    Map<String, dynamic> data = {'email': email, 'password': password};

    String jsonBody = jsonEncode(data);

    try {
      Response response = await post(
          Uri.parse('http://192.168.123.2:6500/auth/register'),
          headers: {'Content-Type': 'application/json'},
          body: jsonBody);
      if (response.statusCode == 201) {
        print('account created successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void login(String email, password) async {
    Map<String, dynamic> data = {'username': email, 'password': password};

    try {
      Response response = await post(
          Uri.parse('http://192.168.123.2:6500/auth/jwt/login'),
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('login success!');
      } else {
        print('Error code: ${response.statusCode}');
        print('Error message: ${response.body}');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
