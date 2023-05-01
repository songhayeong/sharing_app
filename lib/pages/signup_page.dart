import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';
import '../model/user_model.dart';
import '../provider/user_provider.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);

  UserProvider? _userProvider;

  @override
  Widget build(BuildContext context) {
    _userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: Provider.of<UserProvider>(context, listen: false)
                  .emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: Provider.of<UserProvider>(context, listen: false)
                  .passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                _userProvider!.signup(
                  Provider.of<UserProvider>(context, listen: false)
                      .emailController
                      .text
                      .toString(),
                  Provider.of<UserProvider>(context, listen: false)
                      .passwordController
                      .text
                      .toString(),
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text('Sign up'),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/loginEmail');
                },
                child: const Center(
                  child: Text('if you have account? please login!'),
                )),
          ],
        ),
      ),
    );
  }
}
