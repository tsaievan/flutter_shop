import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';

class KBigButton extends StatelessWidget {

  String text;
  Function onPressed;

  KBigButton({String text, Function onPressed}) {
    this.text = text;
    this.onPressed = onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width - 20,
      height: 48,
      child: RaisedButton(
        onPressed: () {
          this.onPressed();
        },
        child: Text(this.text),
        color: KColor.PRIMARY_COLOR,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
    );
  }
}
