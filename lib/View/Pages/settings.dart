import 'package:flutter/material.dart';

import 'FAQ.dart';
import 'Login.dart';
import 'OurPartners.dart';
import 'Support.dart';
import 'TermsConditions.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text("Settings", style: TextStyle(color: Colors.black, fontSize: 25),),
            centerTitle: true,
            elevation: 0,
          ),
          body: Column(
            children: [
              InkResponse(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FAQ()),
                  );
                },
                child: ListTile(
                  title: Text("FAQ"),
                  trailing: Icon(Icons.arrow_forward_ios_sharp),
                ),
              ),
              InkResponse(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TermsConditions()),
                  );
                },
                child: ListTile(
                  title: Text("Terms & Conditions"),
                  trailing: Icon(Icons.arrow_forward_ios_sharp),
                ),
              ),
              InkResponse(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OurPartners()),
                  );
                },
                child: ListTile(
                  title: Text("Our Partners"),
                  trailing: Icon(Icons.arrow_forward_ios_sharp),
                ),
              ),
              InkResponse(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Support()),
                  );
                },
                child: ListTile(
                  title: Text("Support"),
                  trailing: Icon(Icons.arrow_forward_ios_sharp),
                ),
              ),
              InkResponse(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: ListTile(
                  title: Text("Logout"),
                  trailing: Icon(Icons.arrow_forward_ios_sharp),
                ),
              ),
            ],
          ),
        );
  }
}
