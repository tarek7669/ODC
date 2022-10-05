import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/View/Pages/settings.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'Home.dart';
import 'News/News.dart';

class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    News(),
    Settings()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.white,
      //   elevation: 15,
      //   selectedItemColor: Colors.deepOrange,
      //   showUnselectedLabels: false,
      //   iconSize: 35,
      //   onTap: _onItemTapped,
      //   currentIndex: _selectedIndex,
      //   unselectedItemColor: Colors.black,
      //   showSelectedLabels: false,
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       // icon: Icon(Icons.home_filled),
      //       icon: Padding(
      //         padding: const EdgeInsets.only(left: 10),
      //         child: Container(
      //           height: 50,
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.all(Radius.circular(30)),
      //               color: _selectedIndex == 0 ? Colors.grey[200] : Colors.transparent
      //           ),
      //           width: size.width / 3,
      //           padding: const EdgeInsets.only(left: 15),
      //           child: Center(
      //             child: _selectedIndex == 0 ? Row(
      //               children: [
      //                 SvgPicture.asset("assets/icons/home.svg", color: _selectedIndex == 0 ? Colors.deepOrange : Colors.black, ),
      //                 Text("  Home",
      //                   style: TextStyle(
      //                       fontSize: 15,
      //                       fontWeight: FontWeight.bold,
      //                       color: _selectedIndex == 0 ? Colors.deepOrange : Colors.black
      //                   ),)
      //               ],
      //             )
      //                 : SvgPicture.asset("assets/icons/home.svg", color: _selectedIndex == 0 ? Colors.deepOrange : Colors.black, ),
      //           ),
      //         ),
      //       ),
      //       label: 'Home',
      //
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Padding(
      //         padding: const EdgeInsets.only(left: 10, right: 10),
      //         child: Container(
      //           height: 50,
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.all(Radius.circular(30)),
      //               color: _selectedIndex == 1 ? Colors.grey[200] : Colors.transparent
      //           ),
      //           width: size.width / 3,
      //           padding: const EdgeInsets.only(left: 15),
      //           child: Center(
      //             child: _selectedIndex == 1 ? Row(
      //               children: [
      //                 Icon(CupertinoIcons.news),
      //                 Text("  News",
      //                   style: TextStyle(
      //                     fontSize: 15,
      //                     fontWeight: FontWeight.bold,
      //                     color: _selectedIndex == 1 ? Colors.deepOrange : Colors.black,
      //                   ),),
      //               ],
      //             )
      //                 : Icon(CupertinoIcons.news),
      //           ),
      //         ),
      //       ),
      //
      //       label: 'News',
      //     ),
      //     BottomNavigationBarItem(
      //       // icon: Icon(Icons.home_filled),
      //       icon: Padding(
      //         padding: const EdgeInsets.only(right: 15),
      //         child: Container(
      //           height: 50,
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.all(Radius.circular(30)),
      //               color: _selectedIndex == 2 ? Colors.grey[200] : Colors.transparent
      //           ),
      //           width: size.width / 3,
      //           padding: const EdgeInsets.only(left: 15),
      //           child: Center(
      //             child: _selectedIndex == 2 ? Row(
      //               children: [
      //                 SvgPicture.asset("assets/icons/settings.svg", color: _selectedIndex == 2 ? Colors.deepOrange : Colors.black, ),
      //                 Text("  Settings",
      //                   style: TextStyle(
      //                       fontSize: 15,
      //                       fontWeight: FontWeight.bold,
      //                       color: _selectedIndex == 2 ? Colors.deepOrange : Colors.black
      //                   ),)
      //               ],
      //             )
      //                 : SvgPicture.asset("assets/icons/settings.svg", color: _selectedIndex == 2 ? Colors.deepOrange : Colors.black, ),
      //           ),
      //         ),
      //       ),
      //       label: 'Home',
      //
      //     ),
      //   ],
      // ),
      bottomNavigationBar: Container(
        child: GNav(

          activeColor: Colors.deepOrange,
          tabBackgroundColor: Colors.grey.shade300,
          gap: 5,
          iconSize: 30,
          selectedIndex: _selectedIndex,

          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          duration: Duration(milliseconds: 500),
          tabs: [
            GButton(
              leading: SvgPicture.asset('assets/icons/home.svg',
                    color: _selectedIndex == 0 ? Colors.deepOrange : Colors.black,),
              icon: Icons.home,
              text: "Home"
            ),
            GButton(
                icon:CupertinoIcons.news,
                text: "News",
            ),
            GButton(
                leading: SvgPicture.asset('assets/icons/settings.svg',
                  color: _selectedIndex == 2 ? Colors.deepOrange : Colors.black,),
                icon:Icons.settings,
                text: "settings"
            ),
          ]
        )
      ),

      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}