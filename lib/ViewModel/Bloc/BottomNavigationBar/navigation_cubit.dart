import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

  static NavigationCubit get(context) => BlocProvider.of(context);

  int selectedIndex = 0;
  Color color1 = Colors.black;
  Color color2 = Colors.black;
  Color color3 = Colors.black;

  void onChanged(int index) async{
    selectedIndex = index;
    if(selectedIndex == 0){
      color1 = Colors.deepOrange;
      color2 = Colors.black;
      color3 = Colors.black;
    } else if(selectedIndex == 1){
      color1 = Colors.black;
      color2 = Colors.deepOrange;
      color3 = Colors.black;
    }else{
      color1 = Colors.black;
      color2 = Colors.black;
      color3 = Colors.deepOrange;
    }
    emit(NavigationChanged());
  }
}
