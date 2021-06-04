import 'package:flutter_shop/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenUtil {
  static Future<bool> isLogin() async {
    String token = '';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    if (token == '' || token == null) {
      return false;
    }
    return true;
  }

  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    return token;
  }

  static clearUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', '');
    await prefs.setString('username', '');
    await prefs.setInt('id', 0);
    await prefs.setString('head_image', '');
    await prefs.setString('mobile', '');
    await prefs.setString('address', '');
  }

  static Future<Map<String, dynamic>> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username');
    int id = prefs.getInt('id');
    String mobile = prefs.getString('mobile');
    String address = prefs.getString('address');
    return {
      'username' : username,
      'id' : id,
      'mobile' : mobile,
      'address' : address
    };
  }

  static saveLoginInfo(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', userModel.token);
    await prefs.setString('username', userModel.username);
    await prefs.setInt('id', userModel.id);
    await prefs.setString('head_image', userModel.head_image);
    await prefs.setString('mobile', userModel.mobile);
    await prefs.setString('address', userModel.address);
  }
}