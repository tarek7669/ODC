import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Orange ", style: TextStyle(color: Colors.deepOrange, fontSize: 25, fontWeight: FontWeight.bold)),
              Text("Digital Center", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
            ],
          ),

        ],
      ),
    );
  }
}
