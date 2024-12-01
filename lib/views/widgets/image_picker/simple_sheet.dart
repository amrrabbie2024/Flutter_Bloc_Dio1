import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

part 'compoents/s_sheet.dart';

class SimpleSheetWidget extends StatefulWidget {
  const SimpleSheetWidget({super.key});

  @override
  State<SimpleSheetWidget> createState() => _SimpleSheetWidgetState();
}

String? imagePath;


class _SimpleSheetWidgetState extends State<SimpleSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if(imagePath != null)Image.file(
            File(imagePath!), width: 210.w, height: 180.h, fit: BoxFit.fill,),
          SizedBox(height: 16.h,),
          CircleAvatar(radius: 25, child: IconButton(icon: Icon(
              Icons.camera_alt), onPressed: () async {
            imagePath = await showModalBottomSheet(context: context, builder: (context) => MSheetDialog());
            setState(() {

            });
          },
          ),
          )
        ],
      ),
    );
  }
}
