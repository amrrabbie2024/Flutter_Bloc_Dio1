import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/dio_helper.dart';

part 'events.dart';
part 'model.dart';
part 'states.dart';

class MoviesBloc extends Bloc<MoviesEvents,MoviesStates>{
  MoviesBloc():super(MoviesStates()){
    on<GetMoviesEvent> (_getMoviesData);
  }


  Future<void> _getMoviesData(GetMoviesEvent event, Emitter<MoviesStates> emit) async {
    emit(GetMoviesLoadingState());
    
    final response=await DioHelper.get("discover/movie",data:
    {
      "api_key":"2001486a0f63e9e4ef9c4da157ef37cd"
    });
    if(response.isSucess){
      final model=MoviesData.fromJson(response.data);
      emit(GetMoviesSucessState(list: model.list));
    }else{
      print("Error: ${response?.msg}");
      emit(GetMoviesFailedState(msg: response?.msg??""));
    }


  }
}