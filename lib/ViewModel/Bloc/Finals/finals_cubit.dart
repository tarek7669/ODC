import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/Model/FinalsModel.dart';
import 'package:untitled/ViewModel/Database/network/dio_helper.dart';
import 'package:untitled/ViewModel/Database/network/end_points.dart';

import '../../../Constants.dart';

part 'finals_state.dart';

class FinalsCubit extends Cubit<FinalsState> {
  FinalsCubit() : super(FinalsInitial());

  static FinalsCubit get(context) => BlocProvider.of(context);

  FinalsModel ?finalsModel;

  void getFinals()async {
    await DioHelper.getData(url: examsEndPoint, token: Token).then((value) async {
      finalsModel = FinalsModel.fromJson(value.data);
      emit(FinalsSuccess());
    });
  }
}
