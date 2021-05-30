import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/page/user/login_page.dart';
import 'package:flutter_shop/page/category/category_good_list_page.dart';

class RouterUtil {
  static toCategoryGoodListPage(BuildContext context, int _firstCategoryId, int _secondCategoryId) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CategoryGoodListPage(_firstCategoryId, _secondCategoryId))
    );
  }

  static toLoginPage(BuildContext context, String username) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage(username: username,))
    );
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }
}