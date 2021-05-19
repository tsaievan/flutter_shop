import 'package:flutter/material.dart';
import 'package:flutter_shop/config/string.dart';
import 'package:flutter_shop/page/home/home_page.dart';
import 'package:flutter_shop/page/category/category_page.dart';
import 'package:flutter_shop/page/cart/cart_page.dart';
import 'package:flutter_shop/page/user/member_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _currentIndex = 0;
  List<BottomNavigationBarItem> _tabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text(KString.HOME_TITLE),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.category),
      title: Text(KString.CATEGORY_TITLE),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      title: Text(KString.CART_TITLE),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text(KString.MEMBER_TITLE ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: _tabs,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomePage(),
          CategoryPage(),
          CartPage(),
          MemberPage()
        ],
      ),
    );
  }
}
