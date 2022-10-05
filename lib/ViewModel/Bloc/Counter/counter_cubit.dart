import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  static CounterCubit get(context) => BlocProvider.of(context);

  int counter = 0;

  void incCounter(){
    counter++;
    emit(CounterPlus());
  }
  void decCounter(){
    counter--;
    emit(CounterMinus());
  }
}
