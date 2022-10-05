import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/View/Pages/BottomNavigationBar.dart';
import 'package:untitled/View/Pages/Home.dart';
import 'package:untitled/ViewModel/Database/SharedPreferences/SharedPreferences.dart';
import 'package:untitled/ViewModel/Database/network/dio_helper.dart';
import 'package:untitled/ViewModel/Database/network/end_points.dart';
import '../../../Constants.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  String message = '';
  SharedPref shared = SharedPref();


  void login(BuildContext context) async{

    var temp = {
      "email" : email.text.toString(),
      "password" : password.text.toString()
    };

    DioHelper.postData(url: loginEndPoint, data: temp).then((value) async {
      if(value.statusCode == 200){
        Token = value.data['data']['accessToken'];
        shared.setToken("token", Token);
        if(Token != '' && Token != null && Token.isNotEmpty){
          message = "success";
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
        }else{
          message = 'Token Error';
        }
        emit(LoginSuccess());
      }
    }).catchError((e) {
      message = "error";
      emit(LoginError());
    });
  }


}
