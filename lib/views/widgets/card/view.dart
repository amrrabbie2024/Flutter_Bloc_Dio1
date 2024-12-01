import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.all(16.r),
        child: Center(
          child: SizedBox(
            height: 320.h,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(25),topEnd: Radius.circular(25)),
                side: BorderSide(color: Colors.green)
              ),
              color: Colors.yellow,
              shadowColor: Colors.orange,
              elevation: 8,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(radius: 25,backgroundImage: AssetImage("assets/images/flutter.png"),),
                    SizedBox(height: 32.h,),
                    Text("Amr Rabie",style: TextStyle(color: Colors.red,fontSize: 28,fontWeight: FontWeight.w600),),
                    SizedBox(height: 24.h,),
                    Text("Flutter developer",style: TextStyle(color: Colors.blue,fontSize: 24,fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
