import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_thimar/core/logic/dio_helper.dart';

part 'events.dart';
part 'model.dart';
part 'states.dart';

class SliderBloc extends Bloc<SliderEvents,SliderStates>{
  SliderBloc():super(SliderStates()){
    on<GetSliderEvent> (_getData);
  }


  Future<void> _getData(GetSliderEvent event, Emitter<SliderStates> emit) async{
    emit(GetSliderLoadingData());
    
    final response=await DioHelper.get("sliders");
    if(response.isSucess) {
      final model = SliderData.fromJson(response.data);
      emit(GetSliderSucessData(list: model.data));
    }else{
      emit(GetSliderFailedData(msg: response.msg));
    }
  }
}