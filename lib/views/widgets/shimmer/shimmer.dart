import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shimmer"),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.red, fontSize: 24),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 24.h,),
            SizedBox(
              width: 200.0,
              height: 100.0,
              child: Shimmer.fromColors(
                baseColor: Colors.red,
                highlightColor: Colors.yellow,
                child: Text(
                  'Shimmer',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h,),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              enabled: true,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                 Expanded(
                   flex:1,
                   child: CircleAvatar(
                     radius: 35,
                     backgroundColor: Colors.grey.withOpacity(.5),
                   ),
                 ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(
                          width: 160,
                          height: 40,
                          color: Colors.grey.withOpacity(.5),
                        ),
                        SizedBox(height: 8,),
                        Container(
                          width: 120,
                          height: 40,
                          color: Colors.grey.withOpacity(.5),
                        ),
                        SizedBox(height: 8,),
                        Container(
                          width: 90,
                          height: 40,
                          color: Colors.grey.withOpacity(.5),
                        ),
                        SizedBox(height: 8,),
                      ],
                    ),
                  )
                ],
              ),

            ),
            SizedBox(height: 16.h,),
          ],
        ),
      ),
    );
  }
}
