import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/View/Components/Core/TextFormFieldComp.dart';
import 'package:untitled/View/Components/Signup/DropButton.dart';
import 'package:untitled/ViewModel/Bloc/Signup/signup_cubit.dart';

import 'Login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

List<String> genderList = ['Male', 'Female'];
List<String> universityList = ['AUC', 'Cairo', 'ELU', 'GUC', 'Helwan', 'HTI'];
List<String> gradeList = ['Grade 1', 'Grade 2', 'Grade 3', 'Grade 4', 'Grade 5'];

class _SignupState extends State<Signup> {
  String genderValue = genderList.first;
  String universityValue = universityList.first;
  String gradeValue = gradeList.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Orange ", style: TextStyle(color: Colors.deepOrange, fontSize: 25, fontWeight: FontWeight.bold)),
                  Text("Digital Center", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
                ],
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
                child: BlocProvider(
                  create: (context) => SignupCubit(),
                  child: BlocConsumer<SignupCubit, SignupState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      SignupCubit sign = SignupCubit.get(context);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text("Sign Up", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                          ),
                          Text_Form_Field("Name", sign.name),
                          SizedBox(height: 20),
                          Text_Form_Field("E-mail", sign.email),
                          SizedBox(height: 20),
                          Text_Form_Field("Password", sign.password),
                          SizedBox(height: 20),
                          Text_Form_Field("Password", sign.password),
                          SizedBox(height: 20),
                          Text_Form_Field("Phone Number", sign.phone),
                          SizedBox(height: 40),

                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text("Gender",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            )),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                          ),
                                          child: DropdownButton<String>(
                                            value: genderValue,
                                            icon: const Icon(Icons.arrow_drop_down),
                                            elevation: 16,
                                            // style: TextStyle(color: Colors.deepOrange),
                                            // decoration: InputDecoration(
                                            //   enabledBorder: OutlineInputBorder(
                                            //     borderRadius: BorderRadius.all(Radius.circular(20)),
                                            //     borderSide: BorderSide(
                                            //       color: Colors.deepOrange
                                            //     )
                                            //   )
                                            // ),
                                            underline: Container(
                                              height: 1,
                                              color: Colors.deepOrange,
                                            ),

                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                            onChanged: (String? value) {
                                              // This is called when the user selects an item.
                                              setState(() {
                                                genderValue = value!;
                                                sign.gender = value!;
                                              });
                                            },
                                            items: genderList.map<DropdownMenuItem<String>>((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                                    ),
                                                    child: Text(value)),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("University",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                            )),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                          ),
                                          child: DropdownButton<String>(
                                            value: universityValue,
                                            icon: const Icon(Icons.arrow_drop_down),
                                            elevation: 16,
                                            // style: TextStyle(color: Colors.deepOrange),
                                            underline: Container(
                                              height: 1,
                                              color: Colors.deepOrange,
                                            ),

                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                            onChanged: (String? value) {
                                              // This is called when the user selects an item.
                                              setState(() {
                                                universityValue = value!;
                                              });
                                            },
                                            items: universityList.map<DropdownMenuItem<String>>((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                                    ),
                                                    child: Text(value)),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("Grade",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                        )),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                      ),
                                      child: DropdownButton<String>(
                                        value: gradeValue,
                                        icon: const Icon(Icons.arrow_drop_down),
                                        elevation: 16,
                                        // style: TextStyle(color: Colors.deepOrange),
                                        underline: Container(
                                          height: 1,
                                          color: Colors.deepOrange,
                                        ),

                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        onChanged: (String? value) {
                                          // This is called when the user selects an item.
                                          setState(() {
                                            gradeValue = value!;
                                            sign.grade = value!;
                                          });
                                        },
                                        items: gradeList.map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                                ),
                                                child: Text(value)),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    // Dropdown(gradeValue, gradeList),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 40),
                          Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.deepOrange,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(15.0),
                                ),
                              ),
                              onPressed: () {
                                sign.signup(context);
                              },
                              child: Text("Sign Up", style: TextStyle(fontSize: 22, color:Colors.white)),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                              children:[
                                Container(
                                  height: 2,
                                  width: 160,
                                  color: Colors.grey,
                                ),
                                Text(" OR "),
                                Container(
                                  height: 2,
                                  width: 160,
                                  color: Colors.grey,
                                ),
                              ]
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(

                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                side: BorderSide(
                                  width: 2.0,
                                  color: Colors.deepOrange,
                                ),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(15.0),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Login()),
                                );
                              },
                              child: Text("Login", style: TextStyle(fontSize: 22, color:Colors.deepOrange)),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
