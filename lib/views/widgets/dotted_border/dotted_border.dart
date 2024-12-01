import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DottedBorderWidget extends StatelessWidget {
  const DottedBorderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps lancher"),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.red, fontSize: 24),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(

            children: [
              SizedBox(height: 24.h,),
              DottedBorder(
                  padding: EdgeInsets.all(16),
                  color: Colors.orange,
                  radius: Radius.circular(25),
                  borderType: BorderType.RRect,
                  strokeWidth: 3,
                  dashPattern: [
                   20,
                    10
                  ],
                  strokeCap: StrokeCap.round,
                  child: Container(
                    width: 180.w,
                    height: 180.h,
                    color: Colors.grey,
                    child: Center(child: Text("Hello world!")),
                  )
              ),
              SizedBox(height: 16.h,),
            ],
          ),
        ),
      ),
    );
  }
}

