part of 'bloc.dart';

class CitiesStates{}

class GetCitiesLoadingState extends CitiesStates{}

class GetCitiesFailedState extends CitiesStates{
  final String msg;

  GetCitiesFailedState({required this.msg});
}

class GetCitiesSucessState extends CitiesStates{
  final List<CityModel> list;

  GetCitiesSucessState({required this.list});
}