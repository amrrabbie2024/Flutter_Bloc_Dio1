import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class SimpleImagePicker extends StatefulWidget {
  const SimpleImagePicker({super.key});

  @override
  State<SimpleImagePicker> createState() => _SimpleImagePickerState();
}

String? imagePath;

class _SimpleImagePickerState extends State<SimpleImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsetsDirectional.only(start: 16,end: 16,top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if(imagePath!= null)Image.file(File(imagePath!),width: 150.w,height: 150.h,fit: BoxFit.fill,),
              SizedBox(height:24.h),
             FilledButton(onPressed: () async {
               XFile? image=await ImagePicker().pickImage(source: ImageSource.gallery);
               imagePath=image?.path;
               setState(() {
        
               });
             }, child: Text("From Gallery ...")),
              SizedBox(height: 24.h,),
              FilledButton(onPressed: () async {
                XFile? image=await ImagePicker().pickImage(source: ImageSource.camera);
                imagePath=image?.path;
                setState(() {
        
                });
              }, child: Text("From Camera ...")),
              SizedBox(height:24.h),
            ],
          ),
        ),
      ),
    );
  }
}
