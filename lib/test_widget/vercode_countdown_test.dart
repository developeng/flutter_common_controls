import 'package:flutter/material.dart';
import 'package:flutter_common_controls/common_controls/vercode_countdown/vercode_countdown.dart';

class TestVerCodeCountDown extends StatefulWidget {
  @override
  _TestVerCodeCountDownState createState() => _TestVerCodeCountDownState();
}

class _TestVerCodeCountDownState extends State<TestVerCodeCountDown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('验证码倒计时'),),
      body: Container(
        child: Center(
            child: VerCodeCountdownWidget(
              key: verCodeChildKey, countdownTime: 4, onPressed: () {
              verCodeChildKey.currentState.startCountdown();
            },),
        ),
      ),
    );
  }
}
