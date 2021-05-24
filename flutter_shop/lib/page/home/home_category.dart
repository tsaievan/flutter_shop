import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/home_content_model.dart';

class HomeCategory extends StatelessWidget {
  List<HomeCategoryModel> _list;

  HomeCategory(this._list);
  
  Widget _categroyItem(BuildContext context, HomeCategoryModel item) {
    return InkWell(
      onTap: () {
        
      },
      child: Column(
        children: [
          Image.network(
            item.image,
            width: ScreenUtil().setWidth(95),
          ),
          Text(item.name),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_list.length > 10) {
      _list.removeRange(10, _list.length);
    }
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10.0),
      height: ScreenUtil().setHeight(240),
      padding: EdgeInsets.all(3.0),
      child: GridView.builder(
        // 不让它滚动
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemBuilder: (context, index) {
            return _categroyItem(context, _list[index]);
          }
      ),
    );
  }
}