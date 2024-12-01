import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyVerticalDivider extends StatelessWidget {
  const MyVerticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hello"),
            SizedBox(height: 50.h,child: VerticalDivider(color: Colors.green,thickness: 4,)),
            Text("world"),
            SizedBox(height: 50.h,child: VerticalDivider(color: Colors.blue,thickness: 4,)),
            Text("Flutter"),
          ],
        ),
      ),
    );
  }
}
