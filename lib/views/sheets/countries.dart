import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_thimar/core/design/app_image.dart';


class CountriesSheet extends StatefulWidget {
  const CountriesSheet({super.key});

  @override
  State<CountriesSheet> createState() => _CountriesSheetState();
}



class _CountriesSheetState extends State<CountriesSheet> {

  final list=["+20","+534","+65"];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      child: ListView.separated(itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context,[list[index],"Hello$index"]);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              AppImage("egypt.jpg",width: 32.w,height: 24.h,),
              SizedBox(width: 16.w,),
              Text(list[index],style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
            ],
          ),
        );
      }, separatorBuilder: (context, index) => Divider(), itemCount: list.length),
    );
  }
}

