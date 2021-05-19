import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/page/home/home_banner.dart';
import 'package:flutter_shop/page/home/home_category.dart';
import 'package:flutter_shop/page/home/home_good.dart';
import 'package:flutter_shop/model/home_content_model.dart';
import 'package:flutter_shop/service/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  // 防止刷新处理, 保持当前状态
  @override
  bool get wantKeepAlive => true;

  HomeContentModel _homeModel;

  @override
  void initState() {
    super.initState();
    print('首页刷新');
    _initData();
  }

  _initData() async {
    var response = await HttpService.get(ApiUrl.HOME_CONTENT);
    setState(() {
      print(response['data']);
      _homeModel = HomeContentModel.fromJson(response['data']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      appBar: AppBar(
        title: Text(KString.ORDER_TITLE),
      ),
      body: _homeModel == null
      ? Container()
      : ListView(
        children: [
          HomeBanner(_homeModel.banners),
          HomeCategory(_homeModel.categories),
          HomeGood(_homeModel.goods)
        ],
      ),
    );
  }
}