import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_thimar/core/design/app_image.dart';
import 'package:flutter_thimar/core/design/app_input.dart';
import 'package:flutter_thimar/core/logic/cash_helper.dart';
import 'package:flutter_thimar/core/logic/helper_methods.dart';
import 'package:flutter_thimar/views/main/home_nav/pages/home/view.dart';
import 'package:flutter_thimar/views/widgets/banner/view.dart';
import 'package:flutter_thimar/views/widgets/padge/padge.dart';
import 'package:flutter_thimar/views/widgets/rager_slider/range_slider.dart';
import 'package:flutter_thimar/views/widgets/slider/slider.dart';

class HomeNavView extends StatefulWidget {
  const HomeNavView({super.key});

  @override
  State<HomeNavView> createState() => _HomeNavViewState();
}

int currentIndex=0;




class _HomeNavViewState extends State<HomeNavView> {
  final searchController = TextEditingController(text: "text");



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _MyAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(start: 16,end: 16,top: 24),
        child: Builder(builder: (BuildContext context) {
          if(currentIndex == 0)
            return HomePage();
          else if(currentIndex == 1)
            return SliderWidget();
          else if(currentIndex == 2)
            return BannerWidget();
          else if(currentIndex == 3)
            return PadgeWidget();
          else
            return RangerSliderWidget();
        },

        ),
      ),
      drawer: _MyDrawer(),
      bottomNavigationBar: _MyBottomNavigationBar(),
      floatingActionButton: _MyFloatingActionButton(),

    );
  }

  _MyBottomNavigationBar() {
    return ClipRRect(
      borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(25),topEnd: Radius.circular(25)),
      child: BottomNavigationBar(
          backgroundColor: Colors.yellow,
          selectedItemColor: Colors.red,
          selectedFontSize: 24,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex=value;
            setState(() {
      
            });
          },
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.face),label: "Slider"),
        BottomNavigationBarItem(icon: Icon(Icons.time_to_leave),label: "Banner"),
        BottomNavigationBarItem(icon: Icon(Icons.edit),label: "Badge"),
        BottomNavigationBarItem(icon: Icon(Icons.access_time_filled),label: "Range Slider"),
      ] ),
    );
  }

  _MyAppBar() {
    return  AppBar(
      title: Text("Hello ${CashHelper.getFullName()}"),
      centerTitle: false,
      /*leading: CircleAvatar(
        backgroundImage: NetworkImage(CashHelper.getImage(),),
        child: AppImage("egypt.jpg",width: 25,height: 25,),
      ),*/
      actions: [
        IconButton(onPressed: (){
          print(searchController.text);
        }, icon: Icon(Icons.search,color: Theme.of(context).primaryColor,)),
        SizedBox(width: 8.w,),
        IconButton(onPressed: (){
          print(searchController.text+" amr");
        }, icon: Icon(Icons.accessibility_new,color: Theme.of(context).primaryColor,)),
        SizedBox(width: 16.w,),
      ],
      bottom:  PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          child: AppInput(
            controller: searchController,
          ),
        ),
      ),
    );
  }

  _MyDrawer() {
    return Drawer(
      backgroundColor: Colors.yellow,
      shape: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomLeft: Radius.circular(25)),
      ),
      shadowColor: Colors.orange,
      elevation: 36,
      child: SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(start: 16,end: 16,top: 24,bottom: 32),
        child: Column(
          children: [
            Text("My Drawer",style: TextStyle(color: Colors.red,fontSize: 24,fontWeight:FontWeight.w600 ),),
            SizedBox(height: 16,),
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.grey,
              backgroundImage: FileImage(File("assets/images/logo.jpg"),),
              child: AppImage("logo.jpg",width: 50,height: 50,fit: BoxFit.scaleDown,),
            ),
            SizedBox(height: 16,),
            TextButton(onPressed: () {
              navigateTo(PadgeWidget());
            }, child: Text("Paddge Widget")),
            SizedBox(height: 16,),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey,
                  textStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.w600),
                  side: BorderSide(color: Colors.blue),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  foregroundColor: Colors.red
                ),
                onPressed: () {
              navigateTo(BannerWidget());
            }, child: Text("Banner Widget")),
          ],
        ),
      ),
    );
  }

  _MyFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: Colors.grey,
      child: Icon(Icons.edit,color: Theme.of(context).primaryColor,),
      onPressed: () {
        print("Hello World!");
    },);
  }
}
