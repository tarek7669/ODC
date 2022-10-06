

import 'package:flutter/material.dart';

Widget numberField(hint, controller){
  return TextField(
    keyboardType: TextInputType.number,
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