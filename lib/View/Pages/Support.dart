import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Support extends StatelessWidget {
  const Support({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Support", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
        leading: InkResponse(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.deepOrange)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 0),
        child: Column(
          children: [
            TextFormField(
              decoration: new InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  hintText: "Name",
                  prefixIcon: Icon(Icons.person, color: Colors.grey),
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                    // borderSide: new BorderSide(),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange),
                    borderRadius: new BorderRadius.circular(15.0),
                  )
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: new InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  hintText: "E-mail",
                  prefixIcon: Icon(Icons.mail_rounded, color: Colors.grey),
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                    // borderSide: new BorderSide(),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange),
                    borderRadius: new BorderRadius.circular(15.0),
                  )
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              maxLines: 5,
              decoration: new InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  hintText: "What's making you unhappy?",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                    // borderSide: new BorderSide(),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange),
                    borderRadius: new BorderRadius.circular(15.0),
                  )
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          // side: BorderSide(color: Colors.red)
                        )
                    )
                ),
                onPressed: () { },
                child: Text("Submit", style: TextStyle(fontSize: 22,color:Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
