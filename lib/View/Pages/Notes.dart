import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'addNote.dart';

class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey[100],
        child: Icon(CupertinoIcons.plus, color: Colors.black,),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => addNote()),
          );
        }
      ),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkResponse(
          onTap: () {
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.black,)),
        title: Text("Note", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black)),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Container(
            child: Text("There's No Data To Show",
            style: TextStyle(fontSize: 25)),
          ),
        )
      ),
    );
  }
}
