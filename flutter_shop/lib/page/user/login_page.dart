import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  String username;

  LoginPage({this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(username),),
      body: Center(
        child: Text('登录界面' + username),
      ),
    );
  }
}
