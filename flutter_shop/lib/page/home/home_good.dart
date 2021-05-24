import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/home_content_model.dart';
import 'package:flutter_shop/utils/color_util.dart';

class HomeGood extends StatefulWidget {
  List<HomeGoodModel> _goodList = [];


  HomeGood(this._goodList);

  @override
  _HomeGoodState createState() => _HomeGoodState();
}

class _HomeGoodState extends State<HomeGood> {

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      color: Colors.white,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 7.5, right: 7.5),
      child: _goodList(context, width, widget._goodList),
    );
  }

  Widget _goodList(BuildContext context, double deviceWidth, List<HomeGoodModel> productList) {

    double itemWidth = deviceWidth * 168.5 / 360;
    double imageWidth = deviceWidth * 110.0 / 360;

    List<Widget> listWidgets = productList.map((item) {
      var bgColor = ColorUtil.string2Color('#f8f8f8');
      return InkWell(
        onTap: () {

        },
        child: Container(
          width: itemWidth,
          margin: EdgeInsets.only(bottom: 5, left: 2),
          padding: EdgeInsets.only(top: 10, left: 13, bottom: 7),
          color: bgColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name.length > 8 ? item.name.substring(0, 8) : item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, color: Colors.green),
              ),
              Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              Container(
                alignment: Alignment(0, 0),
                margin: EdgeInsets.only(top: 5),
                child: Image.network(
                  item.images.split(',')[0],
                  width: imageWidth,
                  height: imageWidth,
                ),
              ),
              Row(
                children: [
                  Text(
                      '¥${item.discount_price}',
                    style: TextStyle(color: KColor.PRICE_TEXT_COLOR),
                  ),
                  SizedBox(width: 5,),
                  Text(
                    '¥${item.price}',
                    style: KFont.PRICE_STYLE,
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          alignment: Alignment.center,
          child: Text(
            KString.NEW_GOOD_TITLE,
            style: TextStyle(color: KColor.HOME_SUB_TITLE_COLOR),
          ),
        ),
        Wrap(
          children: listWidgets,
        )
      ],
    );
  }
}
