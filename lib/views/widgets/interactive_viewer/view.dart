import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_thimar/core/design/app_image.dart';

class MyInteractiveViewer extends StatelessWidget {
  const MyInteractiveViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InteractiveViewer(
          minScale: .5,
          maxScale: 5,
          child: Image.asset(
            "assets/images/logo.jpg",
            width:260.w,
            height: 350.h,
          ),
        ),
      ),
    );
  }
}
