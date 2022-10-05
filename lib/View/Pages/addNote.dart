import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class addNote extends StatelessWidget {
  const addNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkResponse(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.black,)),
        title: Text("Add Note", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black)),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              decoration: new InputDecoration(
                  hintText: "Title",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.cyan)
                  ),
                  disabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.cyan)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.deepOrange)
                  )
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: new InputDecoration(
                  hintText: "Date",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.cyan)
                  ),
                  disabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.cyan)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.deepOrange)
                  )
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              maxLines: 5,
              decoration: new InputDecoration(
                  hintText: "Note",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.cyan)
                  ),
                  disabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.cyan)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.deepOrange)
                  )
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 90,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey[200],
                  ),
                  onPressed: () {  },
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.plus, color: Colors.black),
                      Text("Add", style: TextStyle(color: Colors.black))
                    ],
                  )
              ),
            ),
          ],

        ),
      ),
    );
  }
}
