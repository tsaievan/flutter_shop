import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/category_good_model.dart';

class CategoryGoodListPage extends StatefulWidget {

  int _firstCategoryId = 0;
  int _secondCategoryId = 0;

  CategoryGoodListPage(this._firstCategoryId, this._secondCategoryId);

  @override
  _CategoryGoodListPageState createState() => _CategoryGoodListPageState();

}

class _CategoryGoodListPageState extends State<CategoryGoodListPage> {
  var scrollController = ScrollController();

  List<CategoryGoodListModel> _goodList = [];
  int _pageIndex = 1;
  int _pageSize = 4;
  bool _noMoreData = true;

  @override
  void initState() {
    super.initState();
    _getGoodList();
  }

  _getGoodList() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(KString.GOOD_LIST_TITLE),
      ),
      body: Container(),
    );
  }
}
