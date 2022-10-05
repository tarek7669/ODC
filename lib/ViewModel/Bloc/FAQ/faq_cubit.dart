import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/Model/FaqModel.dart';
import 'package:untitled/ViewModel/Database/network/dio_helper.dart';
import 'package:untitled/ViewModel/Database/network/end_points.dart';

import '../../../Constants.dart';

part 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(FaqInitial());
  static FaqCubit get(context) => BlocProvider.of(context);

  double height = 0;
  bool is_shrinked = true;
  FaqModel ?faqModel;

  void getFaq()async{
    await DioHelper.getData(url: faqEndPoint, token: Token).then((value) async {
      faqModel = FaqModel.fromJson(value.data);
      emit(FaqSuccess());
    });
  }

  void tapped(){
    if(is_shrinked){
      height = 70;
      is_shrinked = false;
    }
    else {
      height = 0;
      is_shrinked = true;
    }

    emit(FaqInitial());
  }

}
