import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

import 'Login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash>
    with TickerProviderStateMixin {

  late AnimationController controller;

  Widget ?container(){
    Future.delayed(Duration(seconds: 10), () {
      return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: LinearProgressIndicator(
            minHeight: 10,
            color: Colors.deepOrange,
            backgroundColor: Colors.grey[300],
            value: controller.value,
          )
      );
    }).then((value) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => Login()));
    });
  }

 @override
  void initState() {
    // TODO: implement initState
   controller = AnimationController(
     vsync: this,
     duration: const Duration(seconds: 5),
   )..addListener(() {
     setState(() {});
   });

   super.initState();

   // Container(
   //     decoration: BoxDecoration(
   //         borderRadius: BorderRadius.all(Radius.circular(20))
   //     ),
   //     child: LinearProgressIndicator(
   //       minHeight: 10,
   //       color: Colors.deepOrange,
   //       backgroundColor: Colors.grey[300],
   //       value: controller.value,
   //     )
   // );


   Timer(Duration(seconds: 5), () =>Navigator.pushReplacement(context,
         MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Orange ", style: TextStyle(color: Colors.deepOrange, fontSize: 25, fontWeight: FontWeight.bold)),
                Text("Digital Center", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
              ],
            ),
            SizedBox(height: 30),
            // AnimatedProgressBar(
            //   width: double.infinity,
            //   height: 10,
            //   value: 1.0,
            //   duration: const Duration(seconds: 2),
            //   // color: Colors.deepOrange,
            //   gradient: const LinearGradient(
            //     colors: [
            //       Colors.deepOrange,
            //       Colors.deepOrange,
            //     ],
            //   ),
            //   backgroundColor: Colors.grey.withOpacity(0.4)),



            // container()!,
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(20))
            //   ),
            //   child: LinearProgressIndicator(
            //     minHeight: 10,
            //     color: Colors.deepOrange,
            //     backgroundColor: Colors.grey[300],
            //     value: controller.value,
            //   )
            // ),
          ],
        ),
      ),
    );
  }
}
