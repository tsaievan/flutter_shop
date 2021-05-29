import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/page/category/category_first.dart';
import 'package:flutter_shop/page/category/category_second.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(KString.CATEGORY_TITLE),
      ),
      body: Container(
        child: Row(
          children: [
            CategoryFirst(),
            Expanded(
                child: CategorySecond()
            )
          ],
        ),
      ),
    );
  }
}