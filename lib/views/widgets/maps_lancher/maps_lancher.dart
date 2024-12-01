import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maps_launcher/maps_launcher.dart';

class MapsLancherWidget extends StatelessWidget {
  const MapsLancherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps lancher"),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.red,fontSize: 24),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 24.h,),

            IconButton(onPressed: ()  {
              MapsLauncher.launchQuery('Mansoura');
            },icon: Icon(Icons.maps_home_work),tooltip: "Maps with quary",),
            SizedBox(height: 16.h,),
            IconButton(onPressed: ()  {
              MapsLauncher.launchCoordinates(37.4220041, -122.0862462);
            },icon: Icon(Icons.map_outlined),tooltip: "Maps with Coordinates"),
            SizedBox(height: 16.h,),
          ],
        ),
      ),
    );
  }
}


