import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/component/show_message.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/category_good_model.dart';
import 'package:flutter_shop/service/http_service.dart';

class CategoryGoodListPage extends StatefulWidget {

  int _firstCategoryId = 0;
  int _secondCategoryId = 0;

  CategoryGoodListPage(this._firstCategoryId, this._secondCategoryId);

  @override
  _CategoryGoodListPageState createState() => _CategoryGoodListPageState();

}

class _CategoryGoodListPageState extends State<CategoryGoodListPage> {
  var scrollController = ScrollController();

  List<CategoryGoodModel> _goodList = [];
  int _pageIndex = 1;
  int _pageSize = 4;
  bool _noMoreData = true;

  @override
  void initState() {
    super.initState();
    _getGoodList();
  }

  _getGoodList() async {
    var param = {
      'category_first' : widget._firstCategoryId,
      'category_second' : widget._secondCategoryId,
      'page_index' : _pageIndex,
      'page_size' : _pageSize
    };
    print(param);
    var response = await HttpService.get(ApiUrl.CATEGORY_GOOD_LIST, param: param);
    print(response);
    CategoryGoodListModel model = CategoryGoodListModel.fromJson(response['data']);
    print(response['data']);
    setState(() {
      _goodList = model.list;
      _noMoreData = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(KString.GOOD_LIST_TITLE),
      ),
      body: _goodList.length > 0 ?
      Container(
        width: 400,
        child: EasyRefresh(
          footer: ClassicalFooter(
            bgColor: Colors.white,
            textColor: KColor.REFRESH_TEXT_COLOR,
            infoText: KString.LOADING,
            showInfo: true,
            noMoreText: _noMoreData ? KString.NO_MORE_DATA : '',
            loadReadyText: KString.LOAD_READY_TEXT
          ),
          child: ListView.builder(
            controller: scrollController,
            itemCount: _goodList.length,
            itemBuilder: (context, index) {
              return _goodListItem(_goodList, index);
            },
          ),
          onRefresh: () async {
            if (_noMoreData) {
              MessageWidget.show(KString.TO_BOTTOM);
            }else {
              _getMoreData();
            }
          },
        ),
      ) : Text(KString.NO_MORE_DATA),
    );
  }

  _getMoreData() async {
    _pageIndex++;
    var param = {
      'category_first' : widget._firstCategoryId,
      'category_second' : widget._secondCategoryId,
      'page_index' : _pageIndex,
      'page_size' : _pageSize
    };
    print(param);
    var response = await HttpService.get(ApiUrl.CATEGORY_GOOD_LIST, param: param);
    print(response);
    CategoryGoodListModel model = CategoryGoodListModel.fromJson(response['data']);
    if (model.list != null && model.list.length > 0) {
      _goodList.addAll(model.list);
      setState(() {
        _goodList = _goodList;
        _noMoreData = false;
      });
    }else {
      setState(() {
        _noMoreData = true;
      });
    }
  }

  Widget _goodListItem(List<CategoryGoodModel> list, int index) {
    return InkWell(
      onTap: () {
        // TODO: 跳转至商品详情
      },
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: KColor.BORDER_COLOR)
          )
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            _goodImage(list, index),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                _goodName(list, index),
                _goodPrice(list, index),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _goodImage(List<CategoryGoodModel> list, int index) {
    return Container(
      width: ScreenUtil().setWidth(160),
      child: Image.network(list[index].images.split(',')[0]),
    );
  }

  Widget _goodName(List<CategoryGoodModel> list, int index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        list[index].name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  Widget _goodPrice(List<CategoryGoodModel> list, int index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: [
          Text(
            KString.GOOD_LIST_PRICE + '${list[index].discount_price}',
            style: TextStyle(color: KColor.PRICE_TEXT_COLOR),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            '¥${list[index].price}',
            style: KFont.PRICE_STYLE,
          ),
        ],
      ),
    );
  }
}
