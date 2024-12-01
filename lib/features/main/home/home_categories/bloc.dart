import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_thimar/core/logic/dio_helper.dart';
import 'package:flutter_thimar/core/logic/helper_methods.dart';

part 'events.dart';
part 'model.dart';
part 'states.dart';

class CategoriesBloc extends Bloc<CategoriesEvents,CategoriesStates>{
  CategoriesBloc():super(CategoriesStates()){
    on<GetCategoriesEvent> (_getData);
  }
  

  Future<void> _getData(GetCategoriesEvent event, Emitter<CategoriesStates> emit) async {
    emit(GetCategoriesLoadingState());
    final response=await DioHelper.get("categories");
    if(response.isSucess){
      final model=CategoriesData.fromJson(response.data);
      emit(GetCategoriesSucessState(list: model.list));
    }else
      emit(GetCategoriesFailedState(msg: response.msg));
  }
}