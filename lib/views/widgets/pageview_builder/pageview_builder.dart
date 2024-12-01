import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_thimar/core/design/app_image.dart';

class PageViewBuilderWidget extends StatefulWidget {
  const PageViewBuilderWidget({super.key});

  @override
  State<PageViewBuilderWidget> createState() => _PageViewBuilderWidgetState();
}

final pageController=PageController();

late TabController tabController;

final list=["egypt.jpg","logo.jpg","egypt.jpg","logo.jpg","egypt.jpg","logo.jpg"];

class _PageViewBuilderWidgetState extends State<PageViewBuilderWidget> with SingleTickerProviderStateMixin {
  
  @override
  void initState() {
    super.initState();
    tabController=TabController(length: list.length, vsync: this);

    Timer.periodic(Duration(seconds: 3), (timer) {
      if(pageController.page!=list.length-1){
        pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear);
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 350.h,
              child: PageView.builder(
                controller: pageController,
                reverse: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  tabController.animateTo(value);
                },
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(16),
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.red)
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: AppImage(list[index],fit: BoxFit.fill,)),
                  );
                },
                itemCount: list.length,
              ),
            ),
            SizedBox(height:  16.h,),
            TabPageSelector(
              controller: tabController,
              color: Colors.orange,
              selectedColor: Colors.green,
              indicatorSize: 24,
            )
          ],
        ),
      ),
    );
  }
}
