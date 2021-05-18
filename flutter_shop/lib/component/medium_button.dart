import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KMediumButton extends StatelessWidget {
  String text;
  Color color;
  Function onPressed;

  KMediumButton({String text, Color color, Function onPressed}) {
    this.text = text;
    this.color = color;
    this.onPressed = onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(300),
      height: ScreenUtil().setHeight(70),
      child: FlatButton(
        onPressed: () async {
          this.onPressed();
        },
        child: Text(this.text,
          style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil().setSp(28)
          ),),
        color: KColor.PRIMARY_COLOR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
