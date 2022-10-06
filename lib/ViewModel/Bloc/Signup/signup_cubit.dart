import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/Model/GradeModel.dart';
import 'package:untitled/Model/UniversityModel.dart';
import 'package:untitled/View/Pages/Login.dart';
import 'package:untitled/ViewModel/Database/network/dio_helper.dart';
import 'package:untitled/ViewModel/Database/network/end_points.dart';

import '../../../Constants.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  static SignupCubit get(context) => BlocProvider.of(context);

  // TextEditingController name = new TextEditingController();
  // TextEditingController email = new TextEditingController();
  // TextEditingController password = new TextEditingController();
  // TextEditingController phone = new TextEditingController();
  // String message = '';
  // String gender = '', uni = '', grade = '';
  //
  //
  //
  //
  // void droplist(String value){
  //   // listValue = value;
  //
  //   emit(SignupDroplist());
  // }
  //
  // void signup(BuildContext context)async {
  //
  //   // var json = {
  //   //   "email" : email.text.toString(),
  //   //   "password" : password.text.toString(),
  //   //   "name" : name.text.toString(),
  //   //   "gender" : "m",
  //   //   "phoneNumber" : phone.text.toString(),
  //   //   "gradeId" : 1,
  //   //   "universityId" : 2,
  //   //   "roleId" : 2,
  //   // };
  //
  //   Map<String, dynamic> json = {
  //     "email" : "medobebo@gmail.com",
  //     "password" : "123456m",
  //     "name" : "TarekAshraf",
  //     "gender" : "m",
  //     "phoneNumber" : "01158180033",
  //     "gradeId" : 1,
  //     "universityId" : 2,
  //     "roleId" : 2,
  //   };
  //
  //
  //   await DioHelper.postData(url: registerEndPoint, data: json)
  //       .then((value) async {
  //     if(value.statusCode == 200){
  //       Token = value.data['data']['accessToken'];
  //       // shared.setToken("token", Token);
  //       if(Token != '' && Token != null && Token.isNotEmpty){
  //         message = "success";
  //         debugPrint("\n\n\n\n" + message + "\n\n\n\n");
  //         // await Timer(
  //         //   Duration(seconds: 2),
  //         //   (){
  //         //     ScaffoldMessenger.of(context).showSnackBar(
  //         //         SnackBar(content: Text("Signed up successfullly"), duration: Duration(seconds: 2),)
  //         //     );
  //         //   }
  //         // );
  //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
  //       }else{
  //         message = 'Token Error';
  //       }
  //       emit(SignupSuccess());
  //     }
  //   }).catchError((error) {
  //     if (error is DioError) {
  //       print(error.response);
  //     }
  //     message = "error";
  //     debugPrint("\n\n\n\n" + error.toString() + "\n\n\n\n");
  //     emit(SignupError());
  //   });
  // }


  List<UniversityModel> universities = [];
  List<GradeModel> grades = [];
  List<DropdownMenuItem>universityDropDownList=[];
  List<DropdownMenuItem>gradeDropDownList=[];

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  String gender = 'm';
  int universityId = 1;
  int gradeId = 1;
  int roleID = 1;

  bool hiddenText1 = false;
  bool hiddenText2 = false;

  int activeTextField = -1;

  void changeActiveTextField(int index){
    activeTextField=index;
    emit(ChangeActiveTextField());
  }

  void changeHiddenText1(){
    hiddenText1=!hiddenText1;
    emit(ChangeHiddenText());
  }

  void changeHiddenText2(){
    hiddenText2=!hiddenText2;
    emit(ChangeHiddenText());
  }



  Future<void> signup(context) async {
    Map<String, dynamic> mp = {
      'email': emailController.text.toString(),
      'password': passwordController.text.toString(),
      'name': nameController.text.toString(),
      'gender': gender,
      'phoneNumber': phoneController.text.toString(),
      'universityId': universityId,
      'roleId': roleID,
      'gradeId': gradeId,
    };
    if(passwordController.text.toString() == confirmPasswordController.text.toString()){

      await DioHelper.postData(url: registerEndPoint, data: mp).then((value) {
        if (value.statusCode == 200) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
          emit(SignupSuccess());
        }
      }).catchError((error) {
        if (error is DioError) {
          print(error.response);
        }
        emit(SignupFail());
      });
    }else{
      debugPrint('Password is not the same');
    }

  }

  Future<void> getAllUniversities() async {
    universities.clear();
    await DioHelper.getData(url: universityEndPoint).then(
          (value) {
        List<dynamic> data = value.data['data'];
        data.forEach(
              (element) {
            UniversityModel model = UniversityModel.fromJson(element);
            universities.add(model);
            universityDropDownList.add(
              DropdownMenuItem<String>(
                value: model.name,
                child: Text(
                  model.name,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          },
        );
        if (universities.length == data.length) {
          emit(GetAllUniSuccess());
        }
      },
    ).catchError((error) {
      print(error.toString());
      emit(GetAllUniFail());
    });
  }

  Future<void> getAllGrades() async {
    grades.clear();
    await DioHelper.getData(url: gradeEndPoint)
        .then((value) {
      List<dynamic> data = value.data['data'];
      data.forEach(
            (element) {
          GradeModel model = GradeModel.fromJson(element);
          grades.add(model);
          gradeDropDownList.add(DropdownMenuItem<String>(
            value: model.grade,
            child: Text(
              model.grade,
              style: TextStyle(fontSize: 20),
            ),
          ),);
        },
      );
      if (grades.length == data.length) {
        print(grades.length);
        emit(GetAllGradesSuccess());
      }
    },
    ).catchError((error) {
      print(error.toString());
      emit(GetAllGradesFail());
    });
  }


}
