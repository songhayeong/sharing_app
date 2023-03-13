import 'package:fboe_app_writer/provider/signout_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogoutButton extends StatelessWidget {
  LogoutButton({Key? key}) : super(key: key);
  SignoutProvider? _signoutProvider;

  @override
  Widget build(BuildContext context) {
    _signoutProvider = Provider.of<SignoutProvider>(context, listen: false);
    return ElevatedButton(
      onPressed: () {
        //_signoutProvider!.signOut();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xff0165E1))),
      child: const Text("로그아웃"),
    );
  }
}
