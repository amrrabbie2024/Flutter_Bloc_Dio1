import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfirsttask/core/design/app_failed.dart';
import 'package:flutterfirsttask/core/design/app_loading.dart';
import 'package:flutterfirsttask/core/logic/helper_methods.dart';
import 'package:flutterfirsttask/features/movies/bloc.dart';
import 'package:flutterfirsttask/views/movie_details/view.dart';
import 'package:kiwi/kiwi.dart';

class MyGridMovies extends StatefulWidget {
  const MyGridMovies({super.key});

  @override
  State<MyGridMovies> createState() => _MyGridMoviesState();
}

final kbloc=KiwiContainer().resolve<MoviesBloc>();

class _MyGridMoviesState extends State<MyGridMovies> {
  
  @override
  void initState() {
    kbloc.add(getMovieDataEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsetsDirectional.symmetric(horizontal: 16.w),
          child: BlocConsumer(
            bloc: kbloc,
            buildWhen: (previous, current) => current is !MoviesPaginationFinishedState,
            listener: (context, state) {
              if(state is MoviesFailedState)
                showMessage(state.msg);
              else if(state is MoviesSucessState)
                showMessage("Items:- ${state.movieModel.length}",isSucess: true);
            },
            builder: (context, state) {
              if(state is MoviesFailedState)
                return AppFailed();
              else if(state is MoviesSucessState)
                return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if(notification.metrics.pixels == notification.metrics.maxScrollExtent && notification is ScrollUpdateNotification){
                      kbloc.add(getMovieDataEvent());
                    }
                    return true;
                  },
                  child: GridView.builder(
                    //physics: NeverScrollableScrollPhysics(),
                      //scrollDirection: Axis.horizontal,
                      //shrinkWrap: true,
                    //reverse: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.h,
                        crossAxisSpacing: 4.w,
                        childAspectRatio: 180/260
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:  EdgeInsets.all(8.r),
                          child: GestureDetector(
                            onTap: () {
                              navigateTo(MovieDetails(movieId: state.movieModel[index].id,movieTitle: state.movieModel[index].title,));
                              showMessage(state.movieModel[index].title);
                            },
                            child: Card(
                              color: Colors.green.withOpacity(.1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: BorderSide(color: Colors.green)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 8.h,),
                                  CircleAvatar(radius:50,backgroundColor: Colors.green ,child: CircleAvatar(radius: 48,backgroundImage: NetworkImage("http://image.tmdb.org/t/p/w500/${state.movieModel[index].posterPath}"),)),
                                  SizedBox(height: 8.h,),
                                  Text(state.movieModel[index].title.length>12?state.movieModel[index].title.substring(0,12)+" ...":state.movieModel[index].title,style: TextStyle(color: Colors.green,fontSize: 21,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 8.h,),
                                  Text(state.movieModel[index].releaseDate,style: TextStyle(color: Colors.blue,fontSize: 21,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 8.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(state.movieModel[index].voteAverage.toString(),style: TextStyle(color: Colors.red,fontSize: 24,fontWeight: FontWeight.w600),),
                                      SizedBox(width: 4.w,),
                                      Icon(Icons.star,color: Colors.amber,)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    itemCount: state.movieModel.length,
                  ),
                );
              else
                return AppLoading();
              
            },
           
          ),
        ),
      ),
    );
  }
}
