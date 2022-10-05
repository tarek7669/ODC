import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/Model/SectionModel.dart';
import 'package:untitled/ViewModel/Database/network/dio_helper.dart';
import 'package:untitled/ViewModel/Database/network/end_points.dart';

import '../../../Constants.dart';

part 'section_state.dart';

class SectionCubit extends Cubit<SectionState> {
  SectionCubit() : super(SectionInitial());

  static SectionCubit get(context) => BlocProvider.of(context);

  SectionModel ?sectionModel;

  void getSections()async {
    await DioHelper.getData(url: sectionEndPoint, token: Token).then((value) async {
      sectionModel = SectionModel.fromJson(value.data);
      emit(SectionSuccess());
    });
  }

}
