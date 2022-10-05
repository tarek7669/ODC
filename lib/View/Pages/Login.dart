import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/View/Components/Core/TextFormFieldComp.dart';
import 'package:untitled/ViewModel/Bloc/Login/login_cubit.dart';

import '../../main.dart';
import 'BottomNavigationBar.dart';
import 'Signup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
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
              padding: const EdgeInsets.fromLTRB(20, 100, 20, 10),
              child: BlocProvider(
                create: (context) => LoginCubit(),
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    LoginCubit log = LoginCubit.get(context);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text("Login", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                        ),
                        Text_Form_Field("E-mail", log.email),
                        SizedBox(height: 20),
                        Text_Form_Field("Password", log.password),
                        SizedBox(height: 20),
                        Text("Forgot Password?", style: TextStyle(color: Colors.deepOrange)),
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
                              log.login(context);
                            },
                            child: Text("Login", style: TextStyle(fontSize: 22, color:Colors.white)),
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
                                MaterialPageRoute(builder: (context) => Signup()),
                              );
                            },
                            child: Text("Signup", style: TextStyle(fontSize: 22, color:Colors.deepOrange)),
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
      );
  }
}
