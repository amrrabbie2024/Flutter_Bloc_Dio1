import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AnimateDoWidget extends StatelessWidget {
  const AnimateDoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInDownBig(
        duration: Duration(seconds: 3),
        child: Center(
          child: Banner(
            color: Colors.red,
            textStyle: TextStyle(color: Colors.blue,fontWeight: FontWeight.w700),
            message: "Sales 25%",
            location: BannerLocation.topStart,
            child: Container(
              width: 150,
              height: 200,
              decoration:  BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(25)
              ),
            ),),
        ),
      ),
    );;
  }
}
