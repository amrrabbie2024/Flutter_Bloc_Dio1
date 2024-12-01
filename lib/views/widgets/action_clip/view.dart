import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/logic/helper_methods.dart';


class MyActionView extends StatelessWidget {
  const MyActionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ActionChip(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hello world"),
              SizedBox(height: 16.h,),
              Icon(Icons.access_time)
            ],
          ),
          backgroundColor: Colors.yellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          side: BorderSide(
            color: Colors.green,
            style: BorderStyle.solid
          ),
          avatar: CircleAvatar(radius: 25,child: Icon(Icons.time_to_leave_outlined),),
          onPressed: () {
            showMessage("Hello world!",isSucess: true);
          },
          shadowColor: Colors.orange,
          elevation: 8,
          clipBehavior: Clip.hardEdge,
          tooltip: "Click here ...",
        ),
      ),
    );
  }
}
