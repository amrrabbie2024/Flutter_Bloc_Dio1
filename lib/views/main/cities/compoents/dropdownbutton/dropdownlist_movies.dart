
part of '../../view.dart';
class DropDownListMoviesSection extends StatefulWidget {
  const DropDownListMoviesSection({super.key});

  @override
  State<DropDownListMoviesSection> createState() => _DropDownListMoviesSectionState();
}

int? mselectedVvalue;

final kkbloc=KiwiContainer().resolve<MoviesBloc>()..add(GetMoviesEvent());

const String imageUrl="http://image.tmdb.org/t/p/w500/";

class _DropDownListMoviesSectionState extends State<DropDownListMoviesSection> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: kkbloc,
      builder: (context, state) {
        if(state is GetMoviesFailedState)
          return Center(child: Text(state.msg,style: TextStyle(color: Colors.red,fontSize: 32),));
        else if(state is GetMoviesSucessState){
          return DropdownButton(
            itemHeight: 60,
            isExpanded: true,
            icon: Icon(Icons.access_time_filled),
            iconEnabledColor: Colors.green,
            hint: Text("Select city",style: TextStyle(color: Colors.red,fontSize: 18),),
            borderRadius: BorderRadius.circular(25),
            underline: SizedBox(),
            dropdownColor: Colors.yellow,
            focusColor: Colors.orange,
            value: mselectedVvalue,
            items:
            List.generate(state.list.length, (index) =>
                DropdownMenuItem(child: _itemDDB(state.list[index].title,state.list[index].backdropPath),value: state.list[index].id,))
            , onChanged: (value) {
            mselectedVvalue=value;
            setState(() {

            });
          },);
        }else{
          return Center(child: CircularProgressIndicator());
        }
      }, listener: (context, state) {

    },);
  }

  Widget  _itemDDB(String name, String backdropPath) {
    return Row(
      children: [
        Text(name,style: TextStyle(color: Colors.blue,fontSize: 21),),
        Spacer(),
        AppImage(imageUrl+backdropPath,width: 50.w,height: 50.h,fit: BoxFit.scaleDown,)
      ],
    );
  }
}
