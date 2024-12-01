import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_thimar/core/design/app_failed.dart';
import 'package:flutter_thimar/core/design/app_loading.dart';
import 'package:flutter_thimar/features/main/home/home_categories/bloc.dart';
import 'package:flutter_thimar/features/main/home/home_slider/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kiwi/kiwi.dart';

import '../../../../../core/design/app_image.dart';

part 'compoents/category.dart';
part 'compoents/slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding:  EdgeInsets.all(16),
        child: Column(
          children: [
            SliderSection(),
            SizedBox(height: 16.h,),
            CategoriesSection(),
          ],
        ),
    );
  }
}
