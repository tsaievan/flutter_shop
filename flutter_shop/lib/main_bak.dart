import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/component/show_message.dart';
import 'package:flutter_shop/component/small_button.dart';
import 'package:flutter_shop/component/item_text_field.dart';
import 'package:flutter_shop/component/logo_container.dart';
import 'package:flutter_shop/component/circle_check_box.dart';
import 'package:flutter_shop/utils/color_util.dart';
import 'package:flutter_shop/utils/random_util.dart';
import 'package:flutter_shop/utils/router_util.dart';
import 'package:flutter_shop/call/call.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(750, 1334),
        builder: () => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isCheck = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Call.addCallBack('Test', callBack);
  }

  void _incrementCounter() {
    // MessageWidget.show('测试组件');
    // String str = RandomUtil.randomNumeric(10);
    // print(str);

    // var color = ColorUtil.string2Color('333333');
    RouterUtil.toLoginPage(context, 'hello');

    // Call.dispatch('Test', data: {'name' : 'jack'});
  }

  callBack(data) {
    print(data);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            KSmallButton(
              text: '小按钮',
              onPressed: () {
                print('点击了小按钮');
              },
            ),
            SizedBox(
              height: 30,
            ),
            ItemTextField(
              icon: Icon(Icons.person),
              controller: TextEditingController(),
              focusNode: FocusNode(),
              title: '用户名',
              hintText: '请输入用户名',
              obscureText: true,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 10,
            ),
            // LogoContainer()
            CirclrCheckBox(
              value: isCheck,
              onChanged: (bool isSelected) {
                setState(() {
                  isCheck = isSelected;
                });
              },),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
