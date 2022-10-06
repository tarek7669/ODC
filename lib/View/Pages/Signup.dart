import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/View/Components/Core/Button.dart';
import 'package:untitled/View/Components/Core/TextField.dart';
import 'package:untitled/View/Components/Core/TextFormFieldComp.dart';
import 'package:untitled/View/Components/Signup/DropButton.dart';
import 'package:untitled/View/Components/Signup/NumberField.dart';
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

  List<DropdownMenuItem> gender = [
    DropdownMenuItem<dynamic>(
      value: "Male",
      child: Text(
        "Male",
        style: TextStyle(fontSize: 20),
      ),
    ),
    DropdownMenuItem<dynamic>(
      value: "Female",
      child: Text(
        "Female",
        style: TextStyle(fontSize: 20),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: SingleChildScrollView(
    //     physics: BouncingScrollPhysics(),
    //     child: Padding(
    //       padding: const EdgeInsets.only(top: 100.0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Text("Orange ", style: TextStyle(color: Colors.deepOrange, fontSize: 25, fontWeight: FontWeight.bold)),
    //               Text("Digital Center", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
    //             ],
    //           ),
    //
    //           Padding(
    //             padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
    //             child: BlocProvider(
    //               create: (context) => SignupCubit(),
    //               child: BlocConsumer<SignupCubit, SignupState>(
    //                 listener: (context, state) {
    //                   // TODO: implement listener
    //                 },
    //                 builder: (context, state) {
    //                   SignupCubit sign = SignupCubit.get(context);
    //                   return Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Padding(
    //                         padding: const EdgeInsets.only(bottom: 10.0),
    //                         child: Text("Sign Up", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
    //                       ),
    //                       Text_Form_Field("Name", sign.name),
    //                       SizedBox(height: 20),
    //                       Text_Form_Field("E-mail", sign.email),
    //                       SizedBox(height: 20),
    //                       Text_Form_Field("Password", sign.password),
    //                       SizedBox(height: 20),
    //                       Text_Form_Field("Password", sign.password),
    //                       SizedBox(height: 20),
    //                       numberField("Phone Number", sign.phone),
    //                       SizedBox(height: 40),
    //
    //                       Padding(
    //                         padding: const EdgeInsets.only(left: 30, right: 30),
    //                         child: Column(
    //                           crossAxisAlignment: CrossAxisAlignment.center,
    //                           children: [
    //                             Row(
    //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                               children: [
    //                                 Column(
    //                                   children: [
    //                                     Text("Gender",
    //                                         style: TextStyle(
    //                                           fontSize: 20,
    //                                           fontWeight: FontWeight.w600,
    //                                         )),
    //                                     Container(
    //                                       decoration: BoxDecoration(
    //                                         borderRadius: BorderRadius.all(Radius.circular(20)),
    //                                       ),
    //                                       child: DropdownButton<String>(
    //                                         value: genderValue,
    //                                         icon: const Icon(Icons.arrow_drop_down),
    //                                         elevation: 16,
    //                                         // style: TextStyle(color: Colors.deepOrange),
    //                                         // decoration: InputDecoration(
    //                                         //   enabledBorder: OutlineInputBorder(
    //                                         //     borderRadius: BorderRadius.all(Radius.circular(20)),
    //                                         //     borderSide: BorderSide(
    //                                         //       color: Colors.deepOrange
    //                                         //     )
    //                                         //   )
    //                                         // ),
    //                                         underline: Container(
    //                                           height: 1,
    //                                           color: Colors.deepOrange,
    //                                         ),
    //
    //                                         borderRadius: BorderRadius.all(Radius.circular(20)),
    //                                         onChanged: (String ?value) {
    //                                           // This is called when the user selects an item.
    //                                           setState(() {
    //                                             genderValue = value.toString();
    //                                             // sign.gender = value!;
    //                                           });
    //                                         },
    //                                         items: genderList.map<DropdownMenuItem<String>>((String value) {
    //                                           return DropdownMenuItem<String>(
    //                                             value: value,
    //                                             child: Container(
    //                                                 decoration: BoxDecoration(
    //                                                   borderRadius: BorderRadius.all(Radius.circular(20)),
    //                                                 ),
    //                                                 child: Text(value)),
    //                                           );
    //                                         }).toList(),
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                                 Column(
    //                                   children: [
    //                                     Text("University",
    //                                         style: TextStyle(
    //                                           fontWeight: FontWeight.w600,
    //                                           fontSize: 20,
    //                                         )),
    //                                     Container(
    //                                       decoration: BoxDecoration(
    //                                         borderRadius: BorderRadius.all(Radius.circular(20)),
    //                                       ),
    //                                       child: DropdownButton<String>(
    //                                         value: universityValue,
    //                                         icon: const Icon(Icons.arrow_drop_down),
    //                                         elevation: 16,
    //                                         // style: TextStyle(color: Colors.deepOrange),
    //                                         underline: Container(
    //                                           height: 1,
    //                                           color: Colors.deepOrange,
    //                                         ),
    //
    //                                         borderRadius: BorderRadius.all(Radius.circular(20)),
    //                                         onChanged: (String? value) {
    //                                           // This is called when the user selects an item.
    //                                           setState(() {
    //                                             universityValue = value!;
    //                                           });
    //                                         },
    //                                         items: universityList.map<DropdownMenuItem<String>>((String value) {
    //                                           return DropdownMenuItem<String>(
    //                                             value: value,
    //                                             child: Container(
    //                                                 decoration: BoxDecoration(
    //                                                   borderRadius: BorderRadius.all(Radius.circular(20)),
    //                                                 ),
    //                                                 child: Text(value)),
    //                                           );
    //                                         }).toList(),
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ],
    //                             ),
    //                             Column(
    //                               children: [
    //                                 Text("Grade",
    //                                     style: TextStyle(
    //                                       fontWeight: FontWeight.w600,
    //                                       fontSize: 20,
    //                                     )),
    //                                 Container(
    //                                   decoration: BoxDecoration(
    //                                     borderRadius: BorderRadius.all(Radius.circular(20)),
    //                                   ),
    //                                   child: DropdownButton<String>(
    //                                     value: gradeValue,
    //                                     icon: const Icon(Icons.arrow_drop_down),
    //                                     elevation: 16,
    //                                     // style: TextStyle(color: Colors.deepOrange),
    //                                     underline: Container(
    //                                       height: 1,
    //                                       color: Colors.deepOrange,
    //                                     ),
    //
    //                                     borderRadius: BorderRadius.all(Radius.circular(20)),
    //                                     onChanged: (String? value) {
    //                                       // This is called when the user selects an item.
    //                                       setState(() {
    //                                         gradeValue = value.toString();
    //                                         // sign.grade = value!;
    //                                       });
    //                                     },
    //                                     items: gradeList.map<DropdownMenuItem<String>>((String value) {
    //                                       return DropdownMenuItem<String>(
    //                                         value: value,
    //                                         child: Container(
    //                                             decoration: BoxDecoration(
    //                                               borderRadius: BorderRadius.all(Radius.circular(20)),
    //                                             ),
    //                                             child: Text(value)),
    //                                       );
    //                                     }).toList(),
    //                                   ),
    //                                 ),
    //                                 // Dropdown(gradeValue, gradeList),
    //                               ],
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //
    //                       SizedBox(height: 40),
    //                       Container(
    //                         width: double.infinity,
    //                         height: 50,
    //                         child: ElevatedButton(
    //                           style: ElevatedButton.styleFrom(
    //                             primary: Colors.deepOrange,
    //                             shape: new RoundedRectangleBorder(
    //                               borderRadius: new BorderRadius.circular(15.0),
    //                             ),
    //                           ),
    //                           onPressed: () {
    //                             sign.signup(context);
    //                           },
    //                           child: Text("Sign Up", style: TextStyle(fontSize: 22, color:Colors.white)),
    //                         ),
    //                       ),
    //                       SizedBox(height: 20),
    //                       Row(
    //                           children:[
    //                             Container(
    //                               height: 2,
    //                               width: 160,
    //                               color: Colors.grey,
    //                             ),
    //                             Text(" OR "),
    //                             Container(
    //                               height: 2,
    //                               width: 160,
    //                               color: Colors.grey,
    //                             ),
    //                           ]
    //                       ),
    //                       SizedBox(height: 20),
    //                       Container(
    //                         width: double.infinity,
    //                         height: 50,
    //                         child: ElevatedButton(
    //
    //                           style: ElevatedButton.styleFrom(
    //                             primary: Colors.white,
    //                             side: BorderSide(
    //                               width: 2.0,
    //                               color: Colors.deepOrange,
    //                             ),
    //                             shape: new RoundedRectangleBorder(
    //                               borderRadius: new BorderRadius.circular(15.0),
    //                             ),
    //                           ),
    //                           onPressed: () {
    //                             Navigator.push(
    //                               context,
    //                               MaterialPageRoute(builder: (context) => Login()),
    //                             );
    //                           },
    //                           child: Text("Login", style: TextStyle(fontSize: 22, color:Colors.deepOrange)),
    //                         ),
    //                       ),
    //                     ],
    //                   );
    //                 },
    //               ),
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );


    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: BlocProvider(
              create: (context) => SignupCubit()
                ..getAllGrades()
                ..getAllUniversities(),
              child: BlocConsumer<SignupCubit, SignupState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var cubit = SignupCubit.get(context);
                  return (cubit.universities.isEmpty || cubit.grades.isEmpty)
                      ? Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Center(child: CircularProgressIndicator()))
                      : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Orange ", style: TextStyle(color: Colors.deepOrange, fontSize: 25, fontWeight: FontWeight.bold)),
                          Text("Digital Center", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Sign up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultTextField(
                          cubit: cubit,
                          onTap: () {
                            cubit.changeActiveTextField(0);
                          },
                          id: 0,
                          function: () {},
                          controller: cubit.nameController,
                          hintText: "Name"),
                      SizedBox(
                        height: 20,
                      ),
                      defaultTextField(
                          cubit: cubit,
                          onTap: () {
                            cubit.changeActiveTextField(1);
                          },
                          id: 1,
                          function: () {},
                          controller: cubit.emailController,
                          hintText: "E-mail"),
                      SizedBox(
                        height: 20,
                      ),
                      defaultTextField(
                          cubit: cubit,
                          onTap: () {
                            cubit.changeActiveTextField(2);
                          },
                          id: 2,
                          function: () {
                            cubit.changeHiddenText1();
                          },
                          pass: true,
                          hidden: cubit.hiddenText1,
                          controller: cubit.passwordController,
                          hintText: "Password",
                          sufficIcon: true),
                      SizedBox(
                        height: 20,
                      ),
                      defaultTextField(
                          cubit: cubit,
                          onTap: () {
                            cubit.changeActiveTextField(3);
                          },
                          id: 3,
                          hidden: cubit.hiddenText2,
                          function: () {
                            cubit.changeHiddenText2();
                          },
                          controller: cubit.confirmPasswordController,
                          pass: true,
                          hintText: "Password",
                          sufficIcon: true),
                      SizedBox(
                        height: 20,
                      ),
                      defaultTextField(
                          cubit: cubit,
                          onTap: () {
                            cubit.changeActiveTextField(4);
                          },
                          id: 4,
                          function: () {},
                          controller: cubit.phoneController,
                          hintText: "Phone Number"),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 120,
                            child: DropDown(
                              cubit: cubit,
                              lable: "Gender",
                              value: "Male",
                              items: gender,
                              onChange: (value) {
                                if (value == "Male") {
                                  cubit.gender = 'm';
                                } else {
                                  cubit.gender = 'f';
                                }
                                print(cubit.gender);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            child: DropDown(
                              cubit: cubit,
                              lable: cubit.universities[0].name,
                              value: cubit.universities[0].name,
                              items: cubit.universityDropDownList,
                              onChange: (value) {
                                // cubit.universityId = value;
                                int count = 0;
                                cubit.universities.forEach((element) {
                                  if (element.name == value.toString()) {
                                    cubit.universityId = count;
                                  }
                                  count++;
                                });
                                print(cubit.universityId);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              minWidth: 120,
                              maxWidth: 200,
                            ),

                            child: DropDown(
                              cubit: cubit,
                              lable: cubit.grades[0].grade,
                              value: cubit.grades[0].grade,
                              items: cubit.gradeDropDownList,
                              onChange: (value) {
                                int count = 0;
                                cubit.grades.forEach((element) {
                                  if (element.grade == value.toString()) {
                                    cubit.gradeId = count;
                                  }
                                  count++;
                                });
                                print(cubit.gradeId);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: defaultButton(
                              cubit: cubit,
                              state: state,
                              text: 'Sign Up',
                              backgroundColor: Colors.deepOrange,
                              textColor: Colors.white,
                              function: () async {
                                cubit.signup(context);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                              )),
                          Text("  OR  "),
                          Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: defaultButton(
                              cubit: cubit,
                              state: state,
                              text: 'Login',
                              backgroundColor: Colors.white,
                              textColor: Colors.deepOrange,
                              function: () async {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
