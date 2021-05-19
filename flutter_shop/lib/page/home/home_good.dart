import 'package:flutter/material.dart';
import 'package:flutter_shop/model/home_content_model.dart';

class HomeGood extends StatefulWidget {
  List<HomeGoodModel> _goodList = [];


  HomeGood(this._goodList);

  @override
  _HomeGoodState createState() => _HomeGoodState();
}

class _HomeGoodState extends State<HomeGood> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Container(),
    );
  }
}
