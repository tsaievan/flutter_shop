import 'package:flutter/material.dart';

class ItemTextField extends StatelessWidget {
  Icon icon;
  TextEditingController controller;
  FocusNode focusNode;
  String title;
  String hintText;
  bool obscureText;
  ItemTextField({this.icon, this.controller, this.focusNode, this.title,
      this.hintText, this.obscureText = false});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 16,
            top: 8,
            width: 18,
            height: 18,
            child: icon,
          ),
          Positioned(
            left: 55,
            right: 10,
            top: 10,
            height: 30,
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none
              ),
              style: TextStyle(
                fontSize: 14,
              ),
              obscureText: obscureText,
            ),
          ),
        ],
      ),
    );
  }
}
