import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/call/notify.dart';
import 'package:flutter_shop/component/item_text_field.dart';
import 'package:flutter_shop/component/logo_container.dart';
import 'package:flutter_shop/component/show_message.dart';
import 'package:flutter_shop/config/color.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/component/big_button.dart';
import 'package:flutter_shop/model/user_model.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/utils/router_util.dart';
import 'package:flutter_shop/utils/token_util.dart';

class RegisterPage extends StatefulWidget {

  String username;

  RegisterPage({this.username});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController _userNameController;
  TextEditingController _pwdController;
  TextEditingController _mobileController;
  TextEditingController _addressController;

  FocusNode _userNameNode = FocusNode();
  FocusNode _pwdNode = FocusNode();
  FocusNode _mobileNode = FocusNode();
  FocusNode _addressNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _pwdController = TextEditingController();
    _mobileController = TextEditingController();
    _addressController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KColor.PRIMARY_COLOR,
        elevation: 0,
        title: Text(KString.REGISTER_TITLE),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LogoContainer(),
            SizedBox(
              height: 80,
            ),
            _registerContent(context)
          ],
        ),
      ),
    );
  }

  Widget _registerContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          _itemTitle(KString.USER_NAME),
          SizedBox(
            height: 10,
          ),
          ItemTextField(
            icon: Icon(Icons.person),
            controller: _userNameController,
            focusNode: _userNameNode,
            title: KString.USER_NAME,
            hintText: KString.PLEASE_INPUT_NAME,
          ),
          SizedBox(
            height: 20,
          ),

          _itemTitle(KString.MOBILE),
          SizedBox(
            height: 10,
          ),
          ItemTextField(
            icon: Icon(Icons.phone),
            controller: _mobileController,
            focusNode: _mobileNode,
            title: KString.MOBILE,
            hintText: KString.PLEASE_INPUT_MOBILE,
          ),
          SizedBox(
            height: 20,
          ),

          _itemTitle(KString.PASSWORD),
          SizedBox(
            height: 10,
          ),
          ItemTextField(
            icon: Icon(Icons.lock),
            controller: _pwdController,
            focusNode: _pwdNode,
            title: KString.PASSWORD,
            hintText: KString.PLEASE_INPUT_PWD,
            obscureText: true,
          ),
          SizedBox(
            height: 20,
          ),

          _itemTitle(KString.ADDRESS),
          SizedBox(
            height: 10,
          ),
          ItemTextField(
            icon: Icon(Icons.home),
            controller: _addressController,
            focusNode: _addressNode,
            title: KString.ADDRESS,
            hintText: KString.PLEASE_INPUT_ADDRESS,
          ),
          SizedBox(
            height: 20,
          ),

          KBigButton(
            onPressed: () {
              if (_checkInput()) {
                _register();
              }
            },
            text: KString.LOGIN_TITLE,
          ),
        ],
      ),
    );
  }

  Widget _itemTitle(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14
        ),
      ),
    );
  }

  bool _checkInput() {
    if (_userNameController.text.length == 0) {
      MessageWidget.show(KString.PLEASE_INPUT_NAME);
      return false;
    }
    else if (_pwdController.text.length == 0) {
      MessageWidget.show(KString.PLEASE_INPUT_PWD);
      return false;
    }
    else if (_mobileController.text.length == 0) {
      MessageWidget.show(KString.PLEASE_INPUT_MOBILE);
      return false;
    }
    else if (_addressController.text.length == 0) {
      MessageWidget.show(KString.PLEASE_INPUT_ADDRESS);
      return false;
    }
    return true;
  }

  _register() async {
    var formData = {
      'username' : _userNameController.text.toString(),
      'password' :_pwdController.text.toString(),
      'mobile' : _mobileController.text.toString(),
      'address' :_addressController.text.toString(),
    };
    var response = await HttpService.post(ApiUrl.USER_REGISTER, param: formData);
    if (response['code'] == 0) {
      UserModel model = UserModel.fromJson(response['data']);
      RouterUtil.toMemberPage(context);
      MessageWidget.show(KString.REGISTER_SUCCESS);
    }else {
      MessageWidget.show(KString.REGISTER_FAILED);
    }
  }
}
