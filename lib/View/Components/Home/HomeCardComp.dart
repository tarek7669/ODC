import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/View/Pages/Lectures.dart';

Widget HomeCardComp(String text, String picPath, BuildContext context, Widget widget){
  return InkResponse(
    onTap: () {
      // action;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => widget),
      );
    },
    // onTap: () => action,
    child: Container(
      width: 180,
      height: 150,
      child: Card(
        shape: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.white)
        ),
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(picPath, height: 55, color: Colors.deepOrange,),
            SizedBox(height: 10),
            Text(text, style: TextStyle(color: Colors.deepOrange, fontSize: 22, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    ),
  );
}