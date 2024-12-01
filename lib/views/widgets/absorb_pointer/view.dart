import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAbsorbPointer extends StatefulWidget {
  const MyAbsorbPointer({super.key});

  @override
  State<MyAbsorbPointer> createState() => _MyAbsorbPointerState();
}
bool isAbleToEdit=false;

class _MyAbsorbPointerState extends State<MyAbsorbPointer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(16.r),
        child: Center(
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AbsorbPointer(
                absorbing: !isAbleToEdit
                ,child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.blue)
                    )
                  ),
                )),
                SizedBox(height: 24.h,),
                OutlinedButton(onPressed: () {
                  setState(() {
                    isAbleToEdit=!isAbleToEdit;
                    print("$isAbleToEdit");
                  });
                }, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Change "),
                    SizedBox(width: 8.w,),
                    Icon(Icons.change_circle,color: Theme.of(context).primaryColor,)
                  ],
                ))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
