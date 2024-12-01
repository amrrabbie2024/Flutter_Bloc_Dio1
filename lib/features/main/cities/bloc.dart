import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_thimar/core/logic/dio_helper.dart';

part 'events.dart';
part 'model.dart';
part 'states.dart';

int countrycode=1;

class Citiesbloc extends Bloc<CitiesEvents,CitiesStates>{
  Citiesbloc():super(CitiesStates()){
    on<GetCitiesEvent> (_getCitiesData);
  }
  

  Future<void> _getCitiesData(GetCitiesEvent event, Emitter<CitiesStates> emit) async {
    emit(GetCitiesLoadingState());
    
    final response=await DioHelper.get("cities/1",data: {

    });

    if(response.isSucess){
      final model=CitiesData.fromJson(response.data);
      emit(GetCitiesSucessState(list: model.list));
    }else{
      emit(GetCitiesFailedState(msg: response.msg));
    }
  }
}
