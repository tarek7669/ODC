import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestInitial());

  static TestCubit get(context) => BlocProvider.of(context);

  TextEditingController testController = new TextEditingController();

  void print(){
    emit(TestPrint());
  }

  void onChanged(String value){
    testController.text = value;
  }
}
