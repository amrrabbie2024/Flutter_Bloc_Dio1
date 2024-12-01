import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfirsttask/core/design/app_failed.dart';
import 'package:flutterfirsttask/core/design/app_loading.dart';
import 'package:flutterfirsttask/core/logic/helper_methods.dart';
import 'package:flutterfirsttask/features/movies/bloc.dart';
import 'package:flutterfirsttask/views/movie_details/view.dart';
import 'package:kiwi/kiwi.dart';

class MyMoviesList extends StatefulWidget {
  const MyMoviesList({super.key});

  @override
  State<MyMoviesList> createState() => _MyMoviesListState();
}

final kbloc=KiwiContainer().resolve<MoviesBloc>();

class _MyMoviesListState extends State<MyMoviesList> {
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
          padding: EdgeInsetsDirectional.symmetric(horizontal: 22.w,vertical: 16.h),
          child: BlocConsumer(
            bloc: kbloc,
            //buildWhen: (previous, current) => current is MoviesSucessState || current is MoviesFailedState || current is MoviesLoadingState ,
            buildWhen: (previous, current) => current is !MoviesPaginationFinishedState,
            listener: (context, state) {
              if(state is MoviesPaginationFinishedState)
                //showMessage(state.msg);
                showMessage("No items is exists");
            },
            builder: (context, state) {
              if(state is MoviesFailedState)
                return AppFailed();
              else if(state is MoviesSucessState)
                return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if(notification.metrics.pixels == notification.metrics.maxScrollExtent && notification is ScrollUpdateNotification){
                      kbloc.add(getMovieDataEvent());
                      showMessage(state.movieModel.length.toString()+" Items",isSucess: true);
                    }
                    return true;
                  },
                  child: ListView.builder(
                    itemCount: state.movieModel.length,
                      itemBuilder: (context, index) =>  _item(state.movieModel[index],context),
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

  Widget _item(MovieModel movie, BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(MovieDetails(movieId: movie.id, movieTitle: movie.title));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: Theme.of(context).primaryColor,width: 2)
        ),
        color: Colors.yellow.withOpacity(.2),
        shadowColor: Colors.orange,
        elevation: 4,
        child: Padding(
          padding:  EdgeInsets.all(8.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 8.h,),
              ClipOval(child: Image.network("http://image.tmdb.org/t/p/w500/${movie.posterPath}",width: 180.w,height: 140.h,fit: BoxFit.fill,)),
              SizedBox(height: 8.h,),
              Text(movie.title,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 24),),
              SizedBox(height: 8.h,),
              Text(movie.overview.length>120?movie.overview.substring(0,120)+" ...":movie.overview,style: TextStyle(color: Colors.black.withOpacity(.4),fontWeight: FontWeight.w300,fontSize: 17),),
              SizedBox(height: 8.h,),
              Text(movie.releaseDate,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 24),),
              SizedBox(height: 8.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(movie.voteAverage.toString(),style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 24),),
                  SizedBox(width: 4.w,),
                  Icon(Icons.star,color: Colors.amber,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}
