import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
