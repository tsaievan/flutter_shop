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
            ),
            _textInputContent(context)
          ],
        ),
      ),
    );
  }

  Widget _textInputContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
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
          ItemTextField(
            icon: Icon(Icons.lock),
            controller: _pwdController,
            focusNode: _pwdNode,
            title: KString.PASSWORD,
            hintText: KString.PLEASE_INPUT_PWD,
          ),
          SizedBox(
            height: 20,
          ),
          KBigButton(
            onPressed: () {
              if (_checkInput()) {
                _login();
              }
            },
            text: KString.LOGIN_TITLE,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _forgetPasswordButton(),
              _registButton()
            ],
          )
        ],
      ),
    );
  }
  
  Widget _forgetPasswordButton() {
    return Container(
      margin: EdgeInsets.all(ScreenUtil().setWidth(40)),
      child: InkWell(
        child: Text(
          KString.FORGET_PASSWORD,
          style: TextStyle(
            color: Colors.black,
            fontSize: ScreenUtil().setSp(28.0),
          ),
        ),
      ),
    );
  }

  Widget _registButton() {
    return Container(
      margin: EdgeInsets.all(ScreenUtil().setWidth(40)),
      child: InkWell(
        onTap: () {
          // TODO: 跳转到注册界面
        },
        child: Text(
          KString.FAST_REGISTER,
          style: TextStyle(
            color: Colors.black,
            fontSize: ScreenUtil().setSp(28.0),
          ),
        ),
      ),
    );
  }

  bool _checkInput() {
    if (_userNameController.text.length == 0) {
      MessageWidget.show(KString.PLEASE_INPUT_NAME);
      return false;
    }else if (_pwdController.text.length == 0) {
      MessageWidget.show(KString.PLEASE_INPUT_PWD);
      return false;
    }
    return true;
  }

  _login() async {
    var formData = {
      'username' : _userNameController.text.toString(),
      'password' :_pwdController.text.toString(),
    };
    var response = await HttpService.post(ApiUrl.USER_LOGIN, param: formData);
    if (response['code'] == 0) {
      UserModel model = UserModel.fromJson(response['data']);
      MessageWidget.show(KString.LOGIN_SUCCESS);
      //
      var data = {
        'username' : model.username,
        'isLogin' : true
      };
      Call.dispatch(Notify.LOGIN_STATUS, data: data);
      RouterUtil.pop(context);
    }else {
      MessageWidget.show(KString.LOGIN_FAILED);
      //
      var data = {
        'username' : '',
        'isLogin' : false
      };
      Call.dispatch(Notify.LOGIN_STATUS, data: data);
    }
  }
}
