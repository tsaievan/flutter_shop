import 'package:flutter/material.dart';
import 'package:flutter_shop/config/string.dart';

class GoodDetailPage extends StatefulWidget {

  String _goodId;

  GoodDetailPage(this._goodId);

  @override
  _GoodDetailPageState createState() => _GoodDetailPageState();
}

class _GoodDetailPageState extends State<GoodDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {

              },
            ),
            title: Text(KString.GOOD_DETAIL_TITLE),
          ),
          body: Stack(
            children: [
              ListView(

              ),
              Positioned(
                bottom: 0,
                left: 0,
              )
            ],
          ),
        )
    );
  }
}
