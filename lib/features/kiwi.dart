import 'package:flutter_thimar/features/auth/login/bloc.dart';
import 'package:flutter_thimar/features/main/cities/bloc.dart';
import 'package:flutter_thimar/features/main/home/home_categories/bloc.dart';
import 'package:flutter_thimar/features/main/home/home_slider/bloc.dart';
import 'package:flutter_thimar/features/movies/list/bloc.dart';
import 'package:kiwi/kiwi.dart';

void initKiwi(){
 // final container=KiwiContainer();

 // container.registerFactory((container) => LoginBloc());

  final container=KiwiContainer();

  container.registerFactory((container) => LoginBloc());

  container.registerFactory((container) => SliderBloc());

  container.registerFactory((container) => CategoriesBloc());

  container.registerFactory((container) => Citiesbloc());

  container.registerFactory((container) => MoviesBloc());
}