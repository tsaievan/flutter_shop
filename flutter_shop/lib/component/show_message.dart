import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MessageWidget {
  static show(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      textColor: Colors.white
    );
  }
}