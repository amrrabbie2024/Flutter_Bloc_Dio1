import 'package:flutter/material.dart';
import 'package:flutter_thimar/views/widgets/padge/padge.dart';
import 'package:flutter_thimar/views/widgets/rager_slider/range_slider.dart';
import 'package:flutter_thimar/views/widgets/slider/slider.dart';

class MTabBarWidget extends StatefulWidget {
  const MTabBarWidget({super.key});

  @override
  State<MTabBarWidget> createState() => _MTabBarWidgetState();
}




class _MTabBarWidgetState extends State<MTabBarWidget> with TickerProviderStateMixin  {

 late TabController _tabController;

 @override
  void initState() {
    super.initState();
    _tabController=TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
   _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab Bar"),
        centerTitle: true,
        backgroundColor: Colors.grey,
        bottom: TabBar(
          indicatorColor: Colors.orange,
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: TextStyle(fontWeight: FontWeight.w700,fontSize: 21,color: Colors.red),
          controller: _tabController,
          dividerColor: Colors.green,
          tabs: const <Widget>[
            Tab(text: "Paddge",icon: Icon(Icons.home),),
            Tab(text: "Slider",icon: Icon(Icons.access_time),),
            Tab(text: "Range Slider",icon: Icon(Icons.ac_unit),)
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          PadgeWidget(),
          SliderWidget(),
          RangerSliderWidget()
        ],
      ),
    );
  }
}
