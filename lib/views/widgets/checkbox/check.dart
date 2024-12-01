import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

final list=["Android","Ios","Web"];

int selectedValue=0;
final checkValues=[false,false,false];

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: List.generate(list.length, (index) =>
       Row(
         children: [
           Checkbox(
             activeColor: Colors.blue,
             //focusColor: Colors.orange,
             checkColor: Colors.orange,
             side: BorderSide(
               color: Colors.green
             ),
             shape: CircleBorder(
               side: BorderSide(
                 //color: Colors.green
               )
             ),
             value: checkValues[index], onChanged: (value) {
             checkValues[index]=value!;
             setState(() {
               print(checkValues[index]);
             });
           },),
           SizedBox(width: 8.w,),
           GestureDetector(
               onTap: () {
                 checkValues[index]=!checkValues[index];
                 print(list[index] + " " + checkValues[index].toString());
                 setState(() {

                 });
               },
               child: Text(list[index],style: TextStyle(color: Colors.red,fontSize: 24),))
         ],
       )),
     )
    );
  }
}
