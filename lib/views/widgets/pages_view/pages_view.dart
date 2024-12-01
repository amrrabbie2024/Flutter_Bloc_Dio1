import 'package:flutter/material.dart';
import 'package:flutter_thimar/views/widgets/banner/view.dart';
import 'package:flutter_thimar/views/widgets/padge/padge.dart';
import 'package:flutter_thimar/views/widgets/rager_slider/range_slider.dart';
import 'package:flutter_thimar/views/widgets/slider/slider.dart';

class PagesViewWidget extends StatelessWidget {
  const PagesViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        onPageChanged: (value) {

        },
        children: [
          BannerWidget(),
          PadgeWidget(),
          SliderWidget(),
          RangerSliderWidget(),


        ],
      ),
    );
  }
}
