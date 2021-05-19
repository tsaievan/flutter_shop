import 'package:flutter/material.dart';
import 'package:flutter_shop/model/home_content_model.dart';

class HomeCategory extends StatelessWidget {
  List<HomeCategoryModel> _list;

  HomeCategory(this._list);

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