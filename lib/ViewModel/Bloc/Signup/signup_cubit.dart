import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/View/Pages/Login.dart';
import 'package:untitled/ViewModel/Database/network/dio_helper.dart';
import 'package:untitled/ViewModel/Database/network/end_points.dart';

import '../../../Constants.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  static SignupCubit get(context) => BlocProvider.of(context);

  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  String message = '';
  String gender = '', uni = '', grade = '';



  void droplist(String value){
    // listValue = value;

    emit(SignupDroplist());
  }

  void signup(BuildContext context)async {

    var json = {
      "email" : email.text.toString(),
      "password" : password.text.toString(),
      "name" : name.text.toString(),
      "gender" : gender,
      "phoneNumber" : phone.text.toString(),
      "gradeId" : grade,
      "roleId" : 2,
    };

    DioHelper.postData(url: registerEndPoint, data: json).then((value) async {
      if(value.statusCode == 200){
        Token = value.data['data']['accessToken'];
        // shared.setToken("token", Token);
        if(Token != '' && Token != null && Token.isNotEmpty){
          message = "success";
          debugPrint("\n\n\n\n" + message + "\n\n\n\n");
          await Timer(
            Duration(seconds: 2),
            (){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Signed up successfullly"), duration: Duration(seconds: 2),)
              );
            }
          );
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
        }else{
          message = 'Token Error';
        }
        emit(SignupSuccess());
      }
    }).catchError((e) {
      message = "error";
      emit(SignupError());
    });
  }

}
