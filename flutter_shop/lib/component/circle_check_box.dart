import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';

class CirclrCheckBox extends StatefulWidget {

  bool value = false;
  Function onChanged;
  CirclrCheckBox({this.value, this.onChanged});

  @override
  _CirclrCheckBoxState createState() => _CirclrCheckBoxState();
}

class _CirclrCheckBoxState extends State<CirclrCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          widget.value = !widget.value;
          widget.onChanged(widget.value);
        },
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: widget.value
          ? Icon(
            Icons.check_circle,
            size: 28.0,
            color: KColor.CHECKBOX_COLOR,
          ) : Icon(
            Icons.panorama_fish_eye,
            size: 28.0,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
