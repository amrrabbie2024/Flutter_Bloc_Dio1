part of 'bloc.dart';

class MoviesStates{}

class GetMoviesLoadingState extends MoviesStates{}

class GetMoviesFailedState extends MoviesStates{
  final String msg;

  GetMoviesFailedState({required this.msg});
}

class GetMoviesSucessState extends MoviesStates{
  final List<MovieModel> list;

  GetMoviesSucessState({required this.list});
}