/*
* 验证码倒计时widget
* */

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

GlobalKey<_VerCodeCountdownWidgetState> verCodeChildKey = GlobalKey();

class VerCodeCountdownWidget extends StatefulWidget {
  final int countdownTime;
  @required
  final VoidCallback onPressed;

  VerCodeCountdownWidget({
    Key key,
    this.countdownTime = 60,
    this.onPressed,
  }) : super(key: key);

  @override
  _VerCodeCountdownWidgetState createState() => _VerCodeCountdownWidgetState();
}

class _VerCodeCountdownWidgetState extends State<VerCodeCountdownWidget> {
  Timer _timer;
  //倒计时数值
  var _countdownTime = 0;
  bool _isFirst = true;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      padding: EdgeInsets.only(right: 0),
      child: Text(handleCodeAutoSizeText(),
          style: TextStyle(color: Colors.black, fontSize: 15)),
      onPressed: () {
        widget.onPressed.call();
      },
    );
  }

  String handleCodeAutoSizeText() {
    if (_countdownTime > 0) {
      return '${_countdownTime}s后重新发送';
    } else {
      if (_isFirst) {
        return '获取验证码';
      } else {
        return '重新获取';
      }
    }
  }

  //倒计时方法
  startCountdown() {
    if (_countdownTime > 0) {
      return;
    }
    _isFirst = false;
    //倒计时时间
    _countdownTime = widget.countdownTime;
    final call = (timer) {
      if (_countdownTime < 1) {
        _countdownTime = 0;
        _timer.cancel();
        _timer = null;
      } else {
        setState(() {
          _countdownTime -= 1;
        });
      }
    };
    if (_timer == null) {
      _timer = Timer.periodic(Duration(seconds: 1), call);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }
}
