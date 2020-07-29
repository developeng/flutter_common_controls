import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 导航栏
 * Created by guoshuyu
 * Date: 2018-07-16
 */

class NavigatorUtils {
  ///替换
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

//  static popToRoot(BuildContext context,{int index = 0}) {
//    Navigator.of(context).pushAndRemoveUntil(
//        new MaterialPageRoute(builder:(context) =>  HomePage(index:index)),
//            (route) => route == null //表示把前面导航置为空，要引入IndexPage页
//    );
//  }

  ///切换无参数页面
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  ///公共打开方式
  static NavigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(context,
        new CupertinoPageRoute(builder: (context) => pageContainer(widget)));
  }

  ///Page页面的容器，做一次通用自定义
  static Widget pageContainer(widget) {
    return widget;
//    return MediaQuery(
//
//        ///不受系统字体缩放影响
//        data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
//            .copyWith(textScaleFactor: 1),
//        child: widget);
  }

  ///弹出 dialog
  static Future<T> showGSYDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }) {
    return showDialog<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return MediaQuery(

              ///不受系统字体缩放影响
              data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                  .copyWith(textScaleFactor: 1),
              child: new SafeArea(child: builder(context)));
        });
  }
}
