import 'package:flutter/material.dart';
import 'package:flutter_common_controls/common_controls/loading_dialog/loading_dialog.dart';
import '../main.dart';

class TestLoadingDialog extends StatefulWidget {
  @override
  _TestLoadingDialogState createState() => _TestLoadingDialogState();
}

class _TestLoadingDialogState extends State<TestLoadingDialog> {

  showLoading(){
    Future.delayed(Duration(seconds: 0)).then((onValue) {
      BuildContext context = navigatorKey.currentState.overlay.context;
      Loading.showLoading(context);
      Future.delayed(Duration(seconds: 3), () {
        Loading.hideLoading(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('网络加载框'),),
      body: Column(
        children: <Widget>[
          FlatButton(
              onPressed: () {
                DPProgressHUD.showLoading(context);
                Future.delayed(Duration(seconds: 3), () {
                  DPProgressHUD.dismiss(context);
                });
              }, child: Text("showLoading"), color: Colors.blue),
          FlatButton(onPressed: () {
            DPProgressHUD.showLoading(context, message: "loading");
            Future.delayed(Duration(seconds: 3), () {
              DPProgressHUD.dismiss(context);
            });
          }, child: Text("showLoadingMessage"), color: Colors.blue),
          FlatButton(onPressed: () {
            DPProgressHUD.showSuccess(context);
          }, child: Text("showSuccess"), color: Colors.blue),
          FlatButton(onPressed: () {
            DPProgressHUD.showSuccess(context, message: "success");
          }, child: Text("showSuccessMessage"), color: Colors.blue),
          FlatButton(onPressed: () {
            DPProgressHUD.showError(context);
          }, child: Text("showError"), color: Colors.blue),
          FlatButton(onPressed: () {
            DPProgressHUD.showError(context, message: "error");
          }, child: Text("showErrorMessage"), color: Colors.blue),
          FlatButton(
              onPressed: () {
                Loading.showLoading(context);
                Future.delayed(Duration(seconds: 3), () {
                  Loading.hideLoading(context);
                });
              }, child: Text("showLoading"), color: Colors.blue),
          FlatButton(
              onPressed: () {
                showLoading();
              }, child: Text("showLoading"), color: Colors.blue),

        ],
      ),
    );
  }
}
