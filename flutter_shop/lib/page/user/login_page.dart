import 'package:flutter/material.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/component/logo_container.dart';
import 'package:flutter_shop/config/color.dart';
import 'package:flutter_shop/config/index.dart';

class LoginPage extends StatefulWidget {

  String username;

  LoginPage({this.username});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _userNameController;
  TextEditingController _pwdController;

  FocusNode _userNameNode = FocusNode();
  FocusNode _pwdNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _pwdController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KColor.PRIMARY_COLOR,
        elevation: 0,
        title: Text(KString.LOGIN_TITLE),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LogoContainer(),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
