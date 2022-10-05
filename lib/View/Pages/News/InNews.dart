import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InNews extends StatelessWidget {
  const InNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 300,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10),
                  child: Container(
                    width: 50,
                    height: 50,
                    // color: Colors.red,
                    // padding: EdgeInsets.only(top: 30, left: 10),
                    child: Card(
                      elevation: 1,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.only(left: 5),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios, color: Colors.deepOrange, size: 20,),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 70),
                    child: Image.asset('assets/images/logo.png')),
              ],
            )
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text("ODCs",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold
                )),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text("2022-07-06",
                  style: TextStyle(
                    color: Colors.deepOrange,
                  )),
          ),
          SizedBox(height: 20),
          Center(
            child: Text("ODS Supports All Universities",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300
                    )),
          ),
        ],
      ),
    );
  }
}
