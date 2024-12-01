part of 'bloc.dart';

class MNewsStates{}

class MNewsLoadingState extends MNewsStates{}

class MNewsFailedState extends MNewsStates{
  final String msg;

  MNewsFailedState({required this.msg});
}

class MNewsSucessState extends MNewsStates{
  final List<MArticles> articles;

  MNewsSucessState({required this.articles});
}

class MNewsPaginationState extends MNewsStates{}

class MNewsPaginationFinishedState extends MNewsStates{
  final String? msg;

  MNewsPaginationFinishedState({this.msg});
}