import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/Model/MidtermsModel.dart';
import 'package:untitled/ViewModel/Database/network/dio_helper.dart';
import 'package:untitled/ViewModel/Database/network/end_points.dart';

import '../../../Constants.dart';

part 'midterm_state.dart';

class MidtermCubit extends Cubit<MidtermState> {
  MidtermCubit() : super(MidtermInitial());

  static MidtermCubit get(context) => BlocProvider.of(context);

  MidtermsModel ?midtermsModel;

  void getMidterms()async {
    await DioHelper.getData(url: examsEndPoint, token: Token).then((value) async {
      midtermsModel = MidtermsModel.fromJson(value.data);
      emit(MidtermSuccess());
    });
  }
}
