import 'package:flutter/material.dart';

Widget CoursesComp(String title, String date, String start, String end){
  return
    Container(
      height: 120,
      child: Card(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide(color: Colors.white)
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Icon(Icons.timer, color: Colors.black54),
                      Text("2hrs",style : TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.black87))
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Lecture Day", style: TextStyle(color: Colors.grey),),
                      Row(
                        children: [
                          Icon(Icons.calendar_view_month,size: 25,),
                          Text(date,style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),)
                        ],
                      )
                    ],
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Start Time", style: TextStyle(color: Colors.grey),),
                        Row(
                          children: [
                            Icon(Icons.watch_later_rounded,size: 25,color: Colors.greenAccent),
                            Text(start)
                          ],
                        )
                      ]
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("End Time", style: TextStyle(color: Colors.grey),),
                        Row(
                          children: [
                            Icon(Icons.watch_later_rounded,size: 25, color: Colors.redAccent,),
                            Text(end)
                          ],
                        )
                      ]
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
}