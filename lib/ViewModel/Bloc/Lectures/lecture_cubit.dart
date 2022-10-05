import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/Model/LectureModel.dart';
import 'package:untitled/ViewModel/Database/network/dio_helper.dart';
import 'package:untitled/ViewModel/Database/network/end_points.dart';

import '../../../Constants.dart';

part 'lecture_state.dart';

class LectureCubit extends Cubit<LectureState> {
  LectureCubit() : super(LectureInitial());

  static LectureCubit get(context) => BlocProvider.of(context);

  LectureModel ?lectureModel;

  void getLectures()async {
    await DioHelper.getData(url: lectureEndPoint, token: Token).then((value) async {
      lectureModel = LectureModel.fromJson(value.data);
      emit(LectureSuccess());
    });
  }
}
