import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_thimar/core/design/app_image.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpCodeView extends StatefulWidget {
  const OtpCodeView({super.key});

  @override
  State<OtpCodeView> createState() => _OtpCodeViewState();
}

class _OtpCodeViewState extends State<OtpCodeView> {

  String code="";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Scaffold(
          body: Center(child: AppImage("logo.jpg",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fill,)),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsetsDirectional.symmetric(horizontal: 16.w),
              child: PinCodeTextField(
                appContext: context,
                length: 4,
                obscureText: false,
                keyboardType: TextInputType.number,
                onCompleted: (value) {
                  code=value;
                  print(code);
                },
                enableActiveFill: true,
                validator: (value) {

                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(15),
                  activeColor: Theme.of(context).primaryColor,
                  selectedColor: Theme.of(context).primaryColor,
                  inactiveColor: Colors.grey,
                  activeFillColor: Colors.orange,
                  selectedFillColor: Colors.orange,
                  inactiveFillColor: Colors.yellow,
                  fieldHeight: 60.h,
                  fieldWidth: 60.w,
                ),

              ),
            )
          ],
        ),
      ),
    ]
    );
  }
}
