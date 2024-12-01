import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_thimar/core/design/app_failed.dart';
import 'package:flutter_thimar/core/design/app_loading.dart';
import 'package:flutter_thimar/features/movies/list/bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/design/app_image.dart';

class MoviesBottomSheet extends StatefulWidget {
  const MoviesBottomSheet({super.key});

  @override
  State<MoviesBottomSheet> createState() => _MoviesBottomSheetState();
}

String movie="Show BootomSheet";
const String imageUrl="http://image.tmdb.org/t/p/w500/";
final bloc=GetIt.I<MoviesBloc>()..add(GetMoviesEvent());

class _MoviesBottomSheetState extends State<MoviesBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          child: FilledButton(onPressed: () {
            _showSheet();
          }, child: Text(movie)),
        ),
      ),
    );
  }

  void _showSheet() {
    showModalBottomSheet(context: context, builder: (context) =>
        _itemSheet(),);
  }

  _itemSheet() {
    return BlocBuilder(
      bloc: bloc
      , builder: (context, state) {
      if (state is GetMoviesFailedState)
        return AppFailed(msg: state.msg);
      else if (state is GetMoviesSucessState)
        return _item(state.list);
      else
        return AppLoading();
    },);
  }

  _item(List<MovieModel> list) {
    List.generate(list.length, (index) =>
        Row(
          children: [
            Text(list[index].title),
            Spacer(),
            AppImage(
              imageUrl + list[index].backdropPath, width: 50, height: 50,)
          ],
        )
    );
  }
}
