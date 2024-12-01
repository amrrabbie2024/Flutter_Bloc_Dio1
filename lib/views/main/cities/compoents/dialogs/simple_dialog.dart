//part of '../../view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_thimar/core/design/app_failed.dart';
import 'package:flutter_thimar/core/design/app_image.dart';
import 'package:flutter_thimar/core/design/app_loading.dart';
import 'package:flutter_thimar/features/movies/list/bloc.dart';
import 'package:kiwi/kiwi.dart';

class mSimpleDialog extends StatefulWidget {
  const mSimpleDialog({super.key});

  @override
  State<mSimpleDialog> createState() => _mSimpleDialogState();
}

String movie="Show Dialog";
const String imageUrl="http://image.tmdb.org/t/p/w500/";

final bloc=KiwiContainer().resolve<MoviesBloc>()..add(GetMoviesEvent());

class _mSimpleDialogState extends State<mSimpleDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Dialog"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FilledButton(onPressed: () {
              _showDialog(context);
            },child: Text(movie)),
          ],
        ),
      ),
    );
  }

   _showDialog(BuildContext context) {


    showDialog(context: context, builder: (context) =>
        SimpleDialog(
          title: Center(child: Text("Select Movie")),
          titleTextStyle: TextStyle(color: Colors.red,fontSize: 25),
          contentPadding: EdgeInsetsDirectional.symmetric(horizontal: 16,vertical: 24),
          backgroundColor: Colors.yellow,
          shadowColor: Colors.orange,
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
              side: BorderSide(color: Colors.red)
          ),
          alignment: AlignmentDirectional.bottomStart,
          children:[
            BlocBuilder(
              bloc: bloc,
                builder: (context, state) {
                  if(state is GetMoviesFailedState)
                    return AppFailed(msg: state.msg);
                  else if(state is GetMoviesSucessState)
                    return  _mItem(state.list) ;
                  else
                    return AppLoading();
                },)


      ]
        ),);

  }

   _mItem(List<MovieModel> list) {
    List.generate(list.length, (index) =>
        _itemDialog(index,list));
  }

 Widget _itemDialog(int index, List<MovieModel> list) {
    return Row(
      children: [
        Text(list[index].title),
        Spacer(),
        AppImage(imageUrl+list[index].backdropPath,width: 50,height: 50,)
      ],
    );
  }


}
