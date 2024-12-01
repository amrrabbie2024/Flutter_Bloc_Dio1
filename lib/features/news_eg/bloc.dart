import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfirsttask/core/logic/dio_helper3.dart';

part 'model.dart';
part 'states.dart';
part 'events.dart';

class MNewsBloc extends Bloc<MNewsEvents,MNewsStates>{
  MNewsBloc():super(MNewsStates()){
    on<getMNewsDataEvent>(_getMnewsData);
  }


  List<MArticles> _articles=[];
  int currentPage=1;
  bool isFromPagination=false;

  Future<void> _getMnewsData(getMNewsDataEvent event, Emitter<MNewsStates> emit) async {
    if(!isFromPagination){
      emit(MNewsLoadingState());
    }else{
      emit(MNewsPaginationState());
    }
    
    final response=await DioHelper4.get("top-headlines",data: {
      "country":event.country_code,
      "apiKey":"391b96a593624603b2a0d9515bb4c269",
      "page":currentPage
    });

    if(response.isSucess){
      final model=MNewsData.fromJson(response.data);
      int pages=(model.totalResults/20).ceil();
      print("Pages:- $pages");
      if(pages >= currentPage) {
        currentPage++;
        isFromPagination = true;
        _articles.addAll(model.articles);
        emit(MNewsSucessState(articles: _articles));
      }/*else if(pages == currentPage){
        _articles.addAll(model.articles);
        emit(MNewsSucessState(articles: _articles));
      }*/
      else{
        emit(MNewsPaginationFinishedState(msg: ""));
      }
    }else{
      print("Error:- ${response.msg}");
      emit(MNewsFailedState(msg: response.msg));
    }

  }

}