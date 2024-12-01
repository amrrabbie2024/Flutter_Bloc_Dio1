import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressBarsWidget extends StatelessWidget {
  const ProgressBarsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LinearProgressIndicator(
            backgroundColor: Colors.yellow,
            color: Colors.orange,
            minHeight: 12,
            borderRadius: BorderRadius.circular(25),
           // value: .5,
          ),
          Spacer(),
          SizedBox(
            height: 80.h,
            width: 80.w,
            child: CircularProgressIndicator(
              backgroundColor: Colors.green,
              color: Colors.blue,
              strokeWidth: 8,
              semanticsLabel: "Loading ...",
              //value: .5,
            ),
          ),
          Spacer(),
          CupertinoActivityIndicator(
            radius: 50,
            color: Colors.green,
           // animating: false,
          )
        ],
      ),
    );
  }
}
