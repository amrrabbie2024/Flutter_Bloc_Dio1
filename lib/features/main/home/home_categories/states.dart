part of 'bloc.dart';

class CategoriesStates{}

class GetCategoriesLoadingState extends CategoriesStates {}

class GetCategoriesFailedState extends CategoriesStates {
  final String msg;

  GetCategoriesFailedState({required this.msg}){
    showMessage(msg);
  }
}

class GetCategoriesSucessState extends CategoriesStates {
  final List<CategoryModel> list;

  GetCategoriesSucessState({required this.list});
}