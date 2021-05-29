import 'package:flutter/material.dart';
import 'package:flutter_shop/call/notify.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/category_model.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategorySecond extends StatefulWidget {
  const CategorySecond({Key key}) : super(key: key);

  @override
  _CategorySecondState createState() => _CategorySecondState();
}

class _CategorySecondState extends State<CategorySecond> {

  List<CategoryModel> _secondList = [];

  int _firstCategoryId = 0;
  int _secondCategoryId = 0;

  @override
  void initState() {
    super.initState();
    Call.addCallBack(Notify.REFRESH_SECOND_CATEGORY, _refreshCategory);
  }

  _refreshCategory(data) {
    setState(() {
      _firstCategoryId = data['firstCategoryId'];
    });
    _getSecondCategory(data['firstCategoryId']);
  }

  _getSecondCategory(int id) async {
    var response = await HttpService.get(ApiUrl.CATEGORY_SECOND, param: {'pid' : id});
    CategoryListModel model = CategoryListModel.fromJson(response['data']);
    print(response['data']);
    if (model.list.length > 0) {
      var secondId = model.list[0].id;
      setState(() {
        _secondList = model.list;
        _secondCategoryId = secondId;
      });
    }
  }
  
  Widget _categoryItem(List<CategoryModel> list, int index) {
    bool _isSelected = (list[index].id == _firstCategoryId);
    return InkWell(
      onTap: () async {
        int id = list[index].id;
        setState(() {
          _firstCategoryId = id;
        });
      },
      child: Container(
        height: ScreenUtil().setHeight(80.0),
        padding: EdgeInsets.only(left: 10, top: 10),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: _isSelected ? KColor.PRIMARY_COLOR : Colors.white
                )
            )
        ),
        alignment: Alignment.center,
        child: Text(
          list[index].name,
          style: TextStyle(
            color: _isSelected ? KColor.PRIMARY_COLOR : Colors.black,
            fontSize: ScreenUtil().setSp(28),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 20.0)
          ),
          GridView.builder(
            // 不让它滚动
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
              ),
              itemCount: _secondList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return _categroyItem(_secondList[index]);
              }
          ),
          Padding(
              padding: EdgeInsets.only(top: 10)
          ),

        ],
      ),
    );
  }

  Widget _categroyItem(CategoryModel categoryModel) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _secondCategoryId = categoryModel.id;
        });
        // TODO: 二级分类点击跳转至商品列表
      },
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Image.network(
              categoryModel.image,
              fit: BoxFit.cover,
              height: 60,
            ),
            Text(
                categoryModel.name,
              style: TextStyle(fontSize: 14.0, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

