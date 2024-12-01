import 'package:flutter_thimar/features/auth/login/bloc.dart';
import 'package:flutter_thimar/features/main/cities/bloc.dart';
import 'package:flutter_thimar/features/main/home/home_categories/bloc.dart';
import 'package:flutter_thimar/features/main/home/home_slider/bloc.dart';
import 'package:flutter_thimar/features/movies/list/bloc.dart';
import 'package:get_it/get_it.dart';

void initGetIt(){
  final getit=GetIt.instance;

  getit.registerFactory(() => LoginBloc());

  getit.registerFactory(() => SliderBloc());

  getit.registerFactory(() => CategoriesBloc());

  getit.registerFactory(() => Citiesbloc());

  getit.registerFactory(() => MoviesBloc());
}