import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLancherWidget extends StatefulWidget {
  const UrlLancherWidget({super.key});

  @override
  State<UrlLancherWidget> createState() => _UrlLancherWidgetState();
}

final Uri _url = Uri.parse('https://flutter.dev');

final Uri _email_url=Uri.parse("mailto:smith@example.org?subject=News&body=New%20plugin");

final Uri _sms_url=Uri.parse("sms:5550101234");

final Uri _phone_url=Uri.parse("tel:+1-555-010-999");



class _UrlLancherWidgetState extends State<UrlLancherWidget> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Url lancher"),
         centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.red,fontSize: 24),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 24.h,),
            IconButton(onPressed: () async {
              if (!await launchUrl(_phone_url)) {
              throw Exception('Could not launch $_url');
              }
            },icon: Icon(Icons.call),),
            SizedBox(height: 16.h,),
            IconButton(onPressed: () async {
              if (!await launchUrl(_sms_url)) {
              throw Exception('Could not launch $_url');
              }
            },icon: Icon(Icons.sms),),
            SizedBox(height: 16.h,),
            IconButton(onPressed: () async {
              if (!await launchUrl(_email_url)) {
              throw Exception('Could not launch $_url');
              }
            },icon: Icon(Icons.email),),
            SizedBox(height: 16.h,),
            IconButton(onPressed: () async {
              if (!await launchUrl(_url)) {
              throw Exception('Could not launch $_url');
              }
            },icon: Icon(Icons.link),tooltip: "Url"),
            SizedBox(height: 16.h,),
          ],
        ),
      ),
    );
  }
}
