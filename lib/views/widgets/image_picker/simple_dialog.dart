import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

part 'compoents/s_dialog.dart';

class ImagePickerWithDialog extends StatefulWidget {
  const ImagePickerWithDialog({super.key});

  @override
  State<ImagePickerWithDialog> createState() => _ImagePickerWithDialogState();
}

String? imagePath;

class _ImagePickerWithDialogState extends State<ImagePickerWithDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if(imagePath!=null)Image.file(File(imagePath!),width: 150.w,height: 150.h,fit: BoxFit.cover,),
          SizedBox(height: 24.h,),
          CircleAvatar(
            radius: 25,
            child: IconButton(
            onPressed: () async {
              imagePath=await showDialog(context: context, builder: (context) =>
              MSimpleDialog(),);
              setState(() {

              });
            }, icon: Icon(Icons.camera_alt,color: Theme.of(context).primaryColor),),
          )
        ],
      ),
    );
  }
}
