import 'package:flutter/material.dart';
import 'package:flutter_common_controls/main.dart';
import 'package:flutter_common_controls/test_widget/custom_textfield_test.dart';
import 'package:flutter_common_controls/test_widget/loading_dialog_test.dart';
import 'package:flutter_common_controls/test_widget/vercode_countdown_test.dart';

import 'common_controls/loading_dialog/loading_dialog.dart';
import 'common_controls/utils/navigator_utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  List <CatalogModel> modelList = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    modelList.add(CatalogModel(name: '自定义带删除，前置图标输入框',widget: TestCustomTextField()));
    modelList.add(CatalogModel(name: '网络加载框',widget: TestLoadingDialog()));
    modelList.add(CatalogModel(name: '验证码倒计时',widget: TestVerCodeCountDown()));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('控件目录'),
        ),
        body:ListView.builder(
      itemCount: modelList.length,
      itemBuilder: _cellForRow,
    ),
    );
  }

  Widget _cellForRow(BuildContext context,int index){
    return GestureDetector(
      onTap: (){
        NavigatorUtils.NavigatorRouter(context, modelList[index].widget);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(modelList[index].name),
      ),
    );
}
}

class CatalogModel{
  final String name;
  final Widget widget;
  CatalogModel({this.name,this.widget});
}
