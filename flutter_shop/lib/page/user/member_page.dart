import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/call/notify.dart';
import 'package:flutter_shop/component/big_button.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/utils/token_util.dart';
import 'package:flutter_shop/component/show_message.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({Key key}) : super(key: key);

  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {

  bool _isLogin = false;
  String _username = '';

  @override
  void initState() {
    super.initState();
    Call.addCallBack(Notify.LOGIN_STATUS, _loginCallBack);
    _checkLogin();
  }

  _checkLogin() async {
    bool login = await TokenUtil.isLogin();
    var user = await TokenUtil.getUserInfo();
    setState(() {
      _isLogin = true;
      _username = 'test';
      // _isLogin = login;
      // _username = user['username'];
    });
   }

  _loginCallBack(data) {
    if (data['isLogin']) {
      setState(() {
        _username = data['username'];
        _isLogin = true;
      });
    }else {
      setState(() {
        _username = '';
        _isLogin = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: ScreenUtil().setHeight(220.0),
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/head_bg.png'),
                fit: BoxFit.cover
              ),
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ClipOval(
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset('assets/images/head.jpeg', fit: BoxFit.cover,),
                    ),
                  ),
                ),
                _isLogin ? Expanded(
                  flex: 1,
                  child: Text(
                    _username,
                    style: TextStyle(color: Colors.white, fontSize: 26),
                  ),
                ) : Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      // TODO: 跳转至登录界面
                    },
                    child: Text(KString.LOGIN_OR_REGISTER, style: TextStyle(color: Colors.white),),
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.assessment, color: Colors.blue,),
            title: Text(KString.ALL_ORDER),
            onTap: () {
              if (_isLogin) {

              }else {
                MessageWidget.show(KString.PLEASE_LOGIN);
              }
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite, color: Colors.redAccent,),
            title: Text(KString.MY_COLLECT),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.attach_money, color: Colors.deepOrange,),
            title: Text(KString.MY_COUPON),
          ),
          Divider(),
          Container(
            width: double.infinity,
            height: 10,
            color: Color.fromRGBO(242, 242, 242, 0.9),
          ),
          ListTile(
            leading: Icon(Icons.phone_in_talk, color: Colors.green,),
            title: Text(KString.ONLINE_SERVICE),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info, color: Colors.black54,),
            title: Text(KString.ABOUT_US),
          ),
          Divider(),
          SizedBox(
            height: 30,
          ),
          _isLogin ?
          KBigButton(
            text: KString.LOGOUT_TITLE,
            onPressed: () {
              // TODO: 清理本地用户信息
              setState(() {
                _isLogin = false;
                _username = '';
              });
              var data = {
                'username' : '',
                'isLogin' : false
              };
              Call.dispatch(Notify.LOGIN_STATUS, data: data);
            },
          )
              :
          Container()
        ],
      ),
    );
  }
}