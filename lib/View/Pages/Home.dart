import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/View/Components/Home/HomeCardComp.dart';

import 'Finals.dart';
import 'Lectures.dart';
import 'Midterms.dart';
import 'Notes.dart';
import 'Sections.dart';
import 'Events.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Orange ", style: TextStyle(color: Colors.deepOrange, fontSize: 25, fontWeight: FontWeight.bold)),
                Text("Digital Center", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
              ],
            ),
            SizedBox(height: 30),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     InkResponse(
            //       onTap: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(builder: (context) => Lectures()),
            //         );
            //       },
            //       child: Container(
            //         width: 180,
            //         height: 150,
            //         child: Card(
            //           shape: OutlineInputBorder(
            //               borderRadius: new BorderRadius.circular(15.0),
            //               borderSide: BorderSide(color: Colors.white)
            //           ),
            //           elevation: 10,
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: [
            //               SvgPicture.asset('assets/icons/lecture.svg', height: 55,),
            //               SizedBox(height: 10),
            //               Text("Lectures", style: TextStyle(color: Colors.deepOrange, fontSize: 22, fontWeight: FontWeight.bold))
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //     InkResponse(
            //       onTap: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(builder: (context) => Sections()),
            //         );
            //       },
            //       child: Container(
            //         width: 180,
            //         height: 150,
            //         child: Card(
            //           shape: OutlineInputBorder(
            //               borderRadius: new BorderRadius.circular(15.0),
            //               borderSide: BorderSide(color: Colors.white)
            //           ),
            //           elevation: 10,
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: [
            //               SvgPicture.asset('assets/icons/sections.svg', height: 55, color: Colors.deepOrange,),
            //               SizedBox(height: 10),
            //               Text("Sections", style: TextStyle(color: Colors.deepOrange, fontSize: 22, fontWeight: FontWeight.bold))
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 20),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     InkResponse(
            //       onTap: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(builder: (context) => Midterms()),
            //         );
            //       },
            //       child: Container(
            //         width: 180,
            //         height: 150,
            //         child: Card(
            //           shape: OutlineInputBorder(
            //               borderRadius: new BorderRadius.circular(15.0),
            //               borderSide: BorderSide(color: Colors.white)
            //           ),
            //           elevation: 10,
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: [
            //               SvgPicture.asset('assets/icons/midterm.svg', height: 55, color:Colors.deepOrange),
            //               SizedBox(height: 10),
            //               Text("Midterms", style: TextStyle(color: Colors.deepOrange, fontSize: 22, fontWeight: FontWeight.bold))
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //     InkResponse(
            //       onTap: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(builder: (context) => Finals()),
            //         );
            //       },
            //       child: Container(
            //         width: 180,
            //         height: 150,
            //         child: Card(
            //           shape: OutlineInputBorder(
            //               borderRadius: new BorderRadius.circular(15.0),
            //               borderSide: BorderSide(color: Colors.white)
            //           ),
            //           elevation: 10,
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: [
            //               SvgPicture.asset('assets/icons/final.svg', height: 55, color:Colors.deepOrange),
            //               SizedBox(height: 10),
            //               Text("Finals", style: TextStyle(color: Colors.deepOrange, fontSize: 22, fontWeight: FontWeight.bold))
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 20),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Container(
            //       width: 180,
            //       height: 150,
            //       child: Card(
            //         shape: OutlineInputBorder(
            //             borderRadius: new BorderRadius.circular(15.0),
            //             borderSide: BorderSide(color: Colors.white)
            //         ),
            //         elevation: 10,
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             SvgPicture.asset('assets/icons/event.svg', height: 55, color:Colors.deepOrange),
            //             SizedBox(height: 10),
            //             Text("Events", style: TextStyle(color: Colors.deepOrange, fontSize: 22, fontWeight: FontWeight.bold))
            //           ],
            //         ),
            //       ),
            //     ),
            //     InkResponse(
            //       onTap: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(builder: (context) => Notes()),
            //         );
            //       },
            //       child: Container(
            //         width: 180,
            //         height: 150,
            //         child: Card(
            //           shape: OutlineInputBorder(
            //             borderRadius: new BorderRadius.circular(15.0),
            //             borderSide: BorderSide(color: Colors.white)
            //           ),
            //           elevation: 10,
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: [
            //               SvgPicture.asset('assets/icons/notes.svg', height: 55, color:Colors.deepOrange),
            //               SizedBox(height: 10),
            //               Text("Notes", style: TextStyle(color: Colors.deepOrange, fontSize: 22, fontWeight: FontWeight.bold))
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeCardComp("Lectures", 'assets/icons/lecture.svg',
                  context, Lectures()
                ),
                HomeCardComp("Sections", 'assets/icons/sections.svg',
                    context, Sections()
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeCardComp("Midterms", 'assets/icons/midterm.svg',
                    context, Midterms()
                ),
                HomeCardComp("Finals", 'assets/icons/final.svg',
                    context, Finals()
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeCardComp("Events", 'assets/icons/event.svg',
                    context, Notes()
                ),
                HomeCardComp("Notes", 'assets/icons/notes.svg',
                    context, Notes()
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
