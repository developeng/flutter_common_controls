import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///author xjl
///description
///date 2019/12/10 14:59
///modify
class DeviceUtil {
  ///沉浸效果
  static setBarStatus(bool isDarkIcon,
      {Color color: Colors.transparent}) async {
    if (Platform.isAndroid) {
      if (isDarkIcon) {
        SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
            statusBarColor: color, statusBarIconBrightness: Brightness.dark);
        SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      } else {
        SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
            statusBarColor: color, statusBarIconBrightness: Brightness.light);
        SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      }
    }
  }

  static getSize(context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Device(queryData.size.width * queryData.devicePixelRatio,
        queryData.size.height * queryData.devicePixelRatio);
  }
}

class Device {
  double width;
  double height;

  Device(this.width, this.height);
}
