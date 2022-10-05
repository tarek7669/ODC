import 'package:flutter/material.dart';

Widget Text_Form_Field(String hint, controller){
  return TextFormField(
    controller: controller,
    decoration: new InputDecoration(
        hintText: hint,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(15.0),
          // borderSide: new BorderSide(),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.deepOrange)
        )
    ),
  );
}