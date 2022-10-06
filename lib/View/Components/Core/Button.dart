import 'package:flutter/material.dart';
Widget defaultButton({
  required cubit,
  required state,
  required String text,
  required Color backgroundColor,
  required Color textColor,
  required Function() function,
}) {
  return SizedBox(
    height: 45,
    child: ElevatedButton(
        onPressed: function,
        // child: (state == LoginLoadingState)
        //     ? SizedBox(
        //     width: 20, height: 20, child: CircularProgressIndicator())
        //     :
        child: Text(
          text,
          style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                side: BorderSide(color: Colors.deepOrange),
              ),
            ))),
  );
}