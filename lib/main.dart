import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:untitled/ViewModel/Database/SharedPreferences/SharedPreferences.dart';
import 'Model/UniversityModel.dart';
import 'View/Pages/Home.dart';
import 'View/Pages/Login.dart';
import 'View/Pages/Test.dart';
import 'ViewModel/Database/SharedPreferences/SharedPreferences.dart';
import 'ViewModel/Database/network/dio_helper.dart';
import 'ViewModel/Database/network/end_points.dart';

void main() async{

  await DioHelper.init();
  // LoginModel modelData;
  // // DioHelper.getData(url: universityEndPoint).then((value) async{
  // //   modelData = await UniversityModel.fromJson(value.data);
  // //   print(modelData.data!);
  // // });
  //
  //
  // // DioHelper.getData(url: loginEndPoint).then((value) async {
  // //   modelData = await LoginModel.fromJson(value.data);
  // //   print("\n\n\nGET Data\n\n\n");
  // //   print(modelData.data);
  // // });
  //
  // //POST DATA
  // var temp = {
  //   "email" : "tohamymedo41@gmail.com",
  //   "password" : "123456m"
  // };
  //
  // DioHelper.postData(url: loginEndPoint, data: temp).then((value) async {
  //     print(value.data['message']);
  //   }
  // );


  // SharedPref shared = SharedPref();
  // bool iss = await shared.check();
  // await shared.init();
  // var pr = SharedPreference.getToken("token");

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SharedPreference.getToken("token").toString() == null ? Login() : Home()
      home: Login()
      // home: iss ? Home() : Login(),
    )
  );
}
// lollllllllllllllllllllllllllllllllll