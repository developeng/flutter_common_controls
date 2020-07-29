import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
/*
* 带删除按钮的输入框
* */

enum TextBorderStyle { None, Line, RoundedRect }

class CustomTextField extends StatefulWidget {
  final String text;
  final bool isHiddenClearBtn;
  final int maxLines;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final TextStyle style;
  final String hintText;
  final TextStyle hintStyle;
  final Color backGroundColor;
  final Color borderColor;
  final double borderWidth;
  final double radius;
  final Color cursorColor;
  final List<TextInputFormatter> inputFormatters;
  final EdgeInsetsGeometry contentPadding;
  final TextBorderStyle textBorderStyle;
  final ValueChanged<String> onChanged;
  final Widget leftWidget;
  final Widget rightWidget;

  CustomTextField({
    Key key,
    this.text,
    this.isHiddenClearBtn = false,
    this.maxLines = 1,
    this.hintText = '',
    this.keyboardType,
    this.textAlign = TextAlign.left,
    this.style = const TextStyle(color: Colors.black, fontSize: 14),
    this.hintStyle = const TextStyle(color: Colors.black26, fontSize: 14),
    this.backGroundColor = Colors.white,
    this.borderColor = Colors.black12,
    this.borderWidth = 1.0,
    this.radius = 5.0,
    this.cursorColor = Colors.blue,
    this.inputFormatters,
    this.contentPadding = const EdgeInsets.all(5),
    this.textBorderStyle = TextBorderStyle.None,
    this.onChanged,
    this.leftWidget,
    this.rightWidget = const Icon(
      Icons.cancel,
      color: Colors.black26,
    ),
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController _textEditingController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController = TextEditingController.fromValue(
      TextEditingValue(
          text: widget.text == null ? '' : widget.text,
          selection: TextSelection.fromPosition(TextPosition(
              affinity: TextAffinity.downstream,
              offset: widget.text?.length ?? 0))),
    );
  }

  @override
  Widget build(BuildContext context) {
    var customTextFieldView = new Row(
      children: <Widget>[
        widget.leftWidget == null
            ? Container()
            : Container(
          child: widget.leftWidget,
        ),
        new Expanded(
          child: new TextField(
            controller: _textEditingController,
            maxLines: widget.maxLines,
            keyboardType: widget.keyboardType,
            textAlign: widget.textAlign,
            style: widget.style,
            decoration: InputDecoration(
              contentPadding: widget.contentPadding,
              isDense: true,
              border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: widget.hintStyle,
            ),
            inputFormatters: widget.inputFormatters,
            onChanged: (text) {
              setState(() {
                if (widget.onChanged != null) {
                  widget.onChanged(text);
                }
              });
            },
          ),
        ),
        widget.isHiddenClearBtn
            ? Container()
            : strNoEmpty(_textEditingController.text)
                ? new InkWell(
                    child: widget.rightWidget,
                    onTap: () {
                      _textEditingController.text = '';
                      setState(() {
                        if (widget.onChanged != null) {
                          widget.onChanged('');
                        }
                      });
                    },
                  )
                : new Container()
      ],
    );
    return Container(
      decoration: widget.textBorderStyle == TextBorderStyle.None
          ? BoxDecoration(
              color: widget.backGroundColor,
            )
          : BoxDecoration(
              border: Border.all(
                  color: widget.borderColor, width: widget.borderWidth),
              borderRadius: widget.textBorderStyle == TextBorderStyle.Line
                  ? BorderRadius.circular(0)
                  : BorderRadius.circular(widget.radius),
              color: widget.backGroundColor,
            ),
      child: customTextFieldView,
    );
  }

}

/// 字符串不为空
bool strNoEmpty(String value) {
  if (value == null) return false;

  return value.trim().isNotEmpty;
}
