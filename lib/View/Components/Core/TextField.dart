import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultTextField({required Function()onTap,required cubit,required int id,required Function ()function ,bool hidden=false,bool pass=false,required controller , required String hintText, bool sufficIcon = false}) {

  return TextFormField(
    onTap: onTap,
    controller: controller,
    obscureText: (hidden)?!pass:pass,
    decoration: InputDecoration(
      label: Text(hintText),
      labelStyle: TextStyle(
        color: (cubit.activeTextField==id)?Colors.deepOrange:Colors.grey,
      ),
      hintStyle: TextStyle(
        color: Colors.grey,
      ),
      suffixIcon: (sufficIcon == true)
          ?Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: (hidden)
            ?InkWell(onTap: function , child: Icon(Icons.remove_red_eye_rounded,color: Colors.deepOrange,))
            :InkWell(onTap: function ,child: Icon(CupertinoIcons.eye_slash_fill,color: Colors.deepOrange,)),
      )
          : null,
      contentPadding: EdgeInsets.all(15),
      // hintText: hintText,
      border: OutlineInputBorder(
        borderSide: BorderSide(),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder:OutlineInputBorder(
        borderSide:  BorderSide(color: Colors.deepOrange, width: 2.0),
        borderRadius: BorderRadius.circular(15.0),
      ),
    ),
  );
}