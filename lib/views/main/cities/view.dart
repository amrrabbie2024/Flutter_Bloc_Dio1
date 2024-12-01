import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_thimar/core/design/app_image.dart';
import 'package:flutter_thimar/features/main/cities/bloc.dart';
import 'package:flutter_thimar/features/movies/list/bloc.dart';
import 'package:kiwi/kiwi.dart';

part 'compoents/dropdownbutton/drop_down_list.dart';
part 'compoents/dropdownbutton/dropdownlist_cities.dart';
part 'compoents/dropdownbutton/dropdownlist_movies.dart';
//part 'compoents/dialogs/simple_dialog.dart';


class CitiesView extends StatefulWidget {


   CitiesView({super.key});

  @override
  State<CitiesView> createState() => _CitiesViewState();
}

class _CitiesViewState extends State<CitiesView> {
  final list=["Cairo","Alex","Mansoura","Tanta"];

  String city="show Dialog";
  String mmcity="Show Bottom Sheet";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(start: 16,end: 16,top: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //DropDownListCitiesSection(),
            //DropDownListSection(),
            DropDownListMoviesSection(),
            SizedBox(height: 24,),
            SizedBox(
              height: 60.h,
              child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(
                        color: Colors.red
                      )
                    )
                  ),
                  onPressed: ()  {
                  _showDialog(context);
              }, child: Text(city,style: TextStyle(color: Colors.blue),)),
            ),
            SizedBox(height: 24,),
            SizedBox(
              height: 60.h,
              child: FilledButton(onPressed: () {
                showmBottomSheet(context);
              }, child: Text(mmcity)),
            ),

          ],
        ),
      ),
    );
  }

   _showDialog(BuildContext context) {
    showDialog(context: context, builder: (context) =>
        SimpleDialog(
          title:  Text("Select City"),
          titleTextStyle: TextStyle(color: Colors.red),
          backgroundColor: Colors.yellow,
          titlePadding: EdgeInsetsDirectional.only(top: 24,start:16,end: 16,bottom: 24 ) ,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(16),topEnd: Radius.circular(16)),
            side: BorderSide(
              color: Colors.red,
              width: 3.r
            )
          ),
          children:
          List.generate(list.length, (index) =>  _dialogItem(context,list[index])),
        )
      ,);
  }

 Widget _dialogItem(BuildContext context,String mcity) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(start:16,end: 16,bottom: 16 ) ,
      child: GestureDetector(
          onTap: () {
            city=mcity;
            mmcity=mcity;
            setState(() {

            });
            Navigator.pop(context);
          },
          child: Text(mcity,style: TextStyle(color: Colors.blue,fontSize: 21),)),
    );
  }

  void showmBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context) {
     return Padding(
       padding: EdgeInsetsDirectional.symmetric(horizontal: 16,vertical: 24),
       child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:
          List.generate(list.length, (index) => _dialogItem(context,list[index])),
        ),
     );
    },);
  }
}
