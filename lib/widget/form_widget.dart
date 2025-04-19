import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final double ?fontSize;
  final int ?maxLine;
  final TextEditingController controller;
  final String hintText;
  const FormWidget(
      {Key? key,
       this.fontSize,
       this.maxLine,
      required this.controller,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        maxLines: maxLine,
        style: TextStyle(fontSize: fontSize),
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ));
  }
}
