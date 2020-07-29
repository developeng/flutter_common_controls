/*
* 网络加载框widget
* */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum DPProgressHUDType {
  /// 成功
  success,

  /// 失败
  error,

  /// 加载中
  loading,
}

class DPProgressHUD {
  static showSuccess(BuildContext context, {String message}) async {
    if (message != null) {
      _show(DPProgressHUDType.success, context, message: message);
    } else {
      _show(DPProgressHUDType.success, context);
    }
    Future.delayed(Duration(seconds: 2), () {
      dismiss(context);
    });
  }

  static showError(BuildContext context, {String message}) {
    if (message != null) {
      _show(DPProgressHUDType.error, context, message: message);
    } else {
      _show(DPProgressHUDType.error, context);
    }
    Future.delayed(Duration(seconds: 2), () {
      dismiss(context);
    });
  }

  static showLoading(BuildContext context, {String message}) {
    if (message != null) {
      _show(DPProgressHUDType.loading, context, message: message);
    } else {
      _show(DPProgressHUDType.loading, context);
    }
  }

  static _show(DPProgressHUDType type, BuildContext context, {String message}) {
    Navigator.push(
        context,
        new ProgressHUD(
            barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
            message: message == null ? "" : message,
            progressType: type));
  }

  static dismiss(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}

class ProgressHUD<T> extends PopupRoute<T> {
  String message;
  DPProgressHUDType progressType;

  ProgressHUD({this.barrierLabel, this.message, this.progressType});

  @override
  Color get barrierColor => null;

  @override
  Duration get transitionDuration => Duration(seconds: 1);

  @override
  bool get barrierDismissible => false;

  @override
  String barrierLabel;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Colors.black87),
            ),
            getProgressHUDWidget()
          ],
        ),
      ),
    );
  }

  Widget getProgressHUDWidget() {
    double iconSize = 50;
    Widget widget;
    switch (this.progressType) {
      case DPProgressHUDType.success:
        widget = Icon(Icons.check, color: Colors.white, size: iconSize);
        break;
      case DPProgressHUDType.error:
        widget = Icon(Icons.close, color: Colors.white, size: iconSize);
        break;
      case DPProgressHUDType.loading:
        widget = CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        );
        break;
    }

    if (this.message == "") {
      return widget;
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          widget,
          Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              child: Text(this.message,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none)))
        ],
      );
    }
  }
}



class Loading {
  static bool isShow = false;

  static showLoading(BuildContext context) {
    if (!isShow) {
      isShow = true;
      showGeneralDialog(
          context: context,
          barrierDismissible: false, // 是否能通过点击空白处关闭
          transitionDuration: const Duration(milliseconds: 150), // 动画时长
          pageBuilder: (BuildContext context, Animation animation,
              Animation secondaryAnimation) {
            return Align(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Theme(
                  data: ThemeData(
                    cupertinoOverrideTheme: CupertinoThemeData(
                      brightness: Brightness.dark,
                    ),
                  ),
                  child: CupertinoActivityIndicator(
                    radius: 14,
                  ),
                ),
              ),
            );
          }).then((value) {
        isShow = false;
      });
    }
  }

  static hideLoading(BuildContext context) {
    if (isShow) {
      Navigator.of(context).pop();
    }
  }
}
