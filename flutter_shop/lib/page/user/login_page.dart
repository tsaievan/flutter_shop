import 'package:flutter/material.dart';
import 'package:flutter_shop/call/call.dart';

class LoginPage extends StatelessWidget {

  String username;

  LoginPage({this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(username),),
      body: Center(
        child: RaisedButton(
          child: Text('点击派发消息'),
          onPressed: () {
            Call.dispatch('Test', data: {'name' : 'loginPage', 'isLogin' : true});
          },
        ),
      ),
    );
  }
}
