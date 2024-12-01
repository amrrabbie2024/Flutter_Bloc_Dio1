import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfirsttask/core/logic/helper_methods.dart';
import 'package:flutterfirsttask/features/movies/bloc.dart';
import 'package:flutterfirsttask/views/movie_details/view.dart';
import 'package:get_it/get_it.dart';

class MyHorzintalList extends StatefulWidget {
  const MyHorzintalList({super.key});

  @override
  State<MyHorzintalList> createState() => _MyHorzintalListState();
}

final gbloc=GetIt.I<MoviesBloc>();

class _MyHorzintalListState extends State<MyHorzintalList> {

  @override
  void initState() {
    gbloc.add(getMovieDataEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: 16.w,end: 16.w),
          child: BlocConsumer(
            bloc: gbloc,
            buildWhen: (previous, current) => current is !MoviesPaginationFinishedState,
            listener: (context, state) {
              if(state is MoviesFailedState)
                showMessage(state.msg);
              else if(state is MoviesSucessState)
                showMessage("sucess, Data loading ...",isSucess: true);
            },
            builder: (context, state) {
              if(state is MoviesFailedState)
                return Center(child: Text(state.msg,style: TextStyle(color: Colors.red,fontSize: 28,fontWeight: FontWeight.w600),));
              else if(state is MoviesSucessState)
                return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if(notification.metrics.pixels == notification.metrics.maxScrollExtent && notification is ScrollUpdateNotification){
                      gbloc.add(getMovieDataEvent());
                      showMessage("Items:- ${state.movieModel.length}");
                    }
                    return true;
                  },
                  child: ListView.separated(
                      //scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: Colors.green)
                          ),
                          child: GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(25),topEnd: Radius.circular(25))
                                ),
                                backgroundColor: Colors.red,
                                content: Center(child: Text(state.movieModel[index].title,style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)),
                              ));
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails(movieId: state.movieModel[index].id, movieTitle: state.movieModel[index].title),));
                            },
                            child: Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                ClipRRect(borderRadius: BorderRadius.circular(25),child: Image.network("http://image.tmdb.org/t/p/w500/${state.movieModel[index].posterPath}",width: double.infinity,height: 180.h,fit: BoxFit.fill,)),
                                Positioned(
                                  bottom: 15,
                                    child: Text(state.movieModel[index].title.length>35?state.movieModel[index].title+" ...":state.movieModel[index].title,style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600,fontSize: 22),)
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(color: Colors.red,thickness: 4),
                      itemCount: state.movieModel.length),
                );
              else
                return Center(child: CircularProgressIndicator(color: Colors.green,backgroundColor: Colors.blue,strokeWidth: 8,));
            },
          )
        ),
      ),
    );
  }
}
