import 'package:flutter/material.dart';
import 'package:flutter_common_controls/custom_textfield.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('测试页面'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: CustomTextField(
                hintText: '请输入',
              ),
            ),
            
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text('测试说明',style: TextStyle(fontSize: 15),),
                    ),
                    flex: 10,
                  ),
                  Expanded(
                      flex: 25,
                      child: Padding(
                          child: CustomTextField(
                            text: '哈哈哈哈哈哈哈哈',
//                          backGroundColor: Colors.black12,
                            hintText: '请输入测试',
                            textBorderStyle: TextBorderStyle.RoundedRect,
                            onChanged: (text) {
                              print(text);
                            },
                          ),
                          padding: EdgeInsets.only(
                            top: 10,
                          )))
                ],
              ),
            )

          ],
        ));
  }
}
