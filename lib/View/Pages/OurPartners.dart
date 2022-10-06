import 'package:flutter/material.dart';

class OurPartners extends StatelessWidget {
  const OurPartners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkResponse(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.black,),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Our Partners",
                  style: TextStyle(
                    color: Colors.black,

                  ),),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 0),
        child: Container(
          height: 300,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.grey[400],
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("ODC",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white
                            )),
                  )
                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}
