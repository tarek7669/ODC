import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/Model/TermsModel.dart';
import 'package:untitled/ViewModel/Database/network/dio_helper.dart';
import 'package:untitled/ViewModel/Database/network/end_points.dart';

import '../../../Constants.dart';

part 'terms_state.dart';

class TermsCubit extends Cubit<TermsState> {
  TermsCubit() : super(TermsInitial());

  static TermsCubit get(context) => BlocProvider.of(context);
  String term = '';
  TermsModel ? termsModel;

  void fetchTerms()async{
    DioHelper.getData(url: termsEndPoint, token: Token).then((value) {
      termsModel = TermsModel.fromJson(value.data);
      emit(TermsSuccess());
    });
  }
}
