import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfirsttask/core/logic/dio_helper2.dart';

part 'states.dart';
part 'events.dart';
part 'model.dart';

class MoviesBloc extends Bloc<MoviesEvents,MoviesStates>{
  MoviesBloc():super(MoviesStates()){
    on<getMovieDataEvent>(_getMovie);
  }

  List<MovieModel> _list=[];
  int currentPage=496;
  bool isLoading=true;


  Future<void> _getMovie(getMovieDataEvent event, Emitter<MoviesStates> emit) async {
    if(isLoading) {
      emit(MoviesLoadingState());
    }

    final response=await DioHelper2.get("discover/movie",data: {
      "api_key":"2001486a0f63e9e4ef9c4da157ef37cd",
      "page":currentPage
    });

    if(response.isSucess){
      final model=MoviesData.fromJson(response.data);
      //if(model.totalPages > currentPage) {
      if(500 > currentPage) {
        currentPage ++;
        isLoading = false;
        _list.addAll(model.movies);
        emit(MoviesSucessState(movieModel: _list));
      }else{
        emit(MoviesPaginationFinishedState(msg: response.msg));
      }
    }else{
      print("Error:- ${response.msg}");
      emit(MoviesFailedState(msg: response.msg));
    }
  }
}