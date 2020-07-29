

import 'package:flutter/material.dart';
import 'package:flutter_common_controls/common_controls/custom_textfield/custom_textfield.dart';


class TestCustomTextField extends StatefulWidget {
  @override
  _TestCustomTextFieldState createState() => _TestCustomTextFieldState();
}

class _TestCustomTextFieldState extends State<TestCustomTextField> {

  List<TextModel>modelList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for(int i = 1;i< 50;i++){
      modelList.add(TextModel(name: '测试说明${i}',content: '哈哈哈哈哈哈哈哈'));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('自定义带删除，前置图标输入框'),),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: CustomTextField(
              hintText: '请输入',
              leftWidget: const Icon(
                Icons.search,
                color: Colors.black26,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: CustomTextField(
              hintText: '请输入',
              textBorderStyle: TextBorderStyle.Line,
              leftWidget: const Icon(
                Icons.search,
                color: Colors.black26,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: CustomTextField(
              hintText: '请输入',
              textBorderStyle: TextBorderStyle.RoundedRect,
              leftWidget: const Icon(
                Icons.search,
                color: Colors.black26,
              ),
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
                          text: '测试哈哈哈',
//                          backGroundColor: Colors.black12,
                          hintText: '请输入测试',
                          textBorderStyle: TextBorderStyle.RoundedRect,
                          onChanged: (text) {
                            print(text);
                          },
                        ),
                        padding: EdgeInsets.only(
                          top: 10,
                        ))),
              ],
            ),
          ),
          Expanded(child: Container(
            child: ListView.builder(
              itemCount: modelList.length,
              itemBuilder: _cellForRow,
            ),
          ))
        ],
      ),
    );
  }

  Widget _cellForRow(BuildContext context,int index){
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(modelList[index].name,style: TextStyle(fontSize: 15),),
            ),
            flex: 10,
          ),
          Expanded(
              flex: 25,
              child: Padding(
                  child: CustomTextField(
                    text: modelList[index].content,
//                          backGroundColor: Colors.black12,
                    hintText: '请输入测试',
                    textBorderStyle: TextBorderStyle.RoundedRect,
                    onChanged: (text) {
                      modelList[index].content = text;
                      setState(() {});
                    },
                  ),
                  padding: EdgeInsets.only(
                    top: 10,
                  ))),
        ],
      ),
    );
  }
}

class TextModel{
  String name;
  String content;
  TextModel({this.name,this.content});
}
