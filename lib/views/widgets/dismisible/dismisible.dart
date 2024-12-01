

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_thimar/views/main/cities/view.dart';

class DismisibleWidget extends StatefulWidget {
  const DismisibleWidget({super.key});

  @override
  State<DismisibleWidget> createState() => _DismisibleWidgetState();
}

final  colors=[Colors.red,Colors.green,Colors.yellow,Colors.blue,Colors.grey];

int currentValue=0;

class _DismisibleWidgetState extends State<DismisibleWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        return GestureDetector(
          onTap:  () {
            currentValue=index;
            colors.removeAt(currentValue);
            setState(() {

            });
          },
          child: Dismissible(
            key: ValueKey(currentValue),
            background: Container(
              width: double.infinity,
              height: 120.h,
              padding:  EdgeInsetsDirectional.only(end: 16),
              child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Icon(Icons.delete,color: Theme.of(context).primaryColor,)),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.orange)
              ),
            ),
            //secondaryBackground: Icon(Icons.delete,color: Theme.of(context).primaryColor,),
            child: Container(
              width: double.infinity,
              height: 120.h,
              decoration: BoxDecoration(
                color: colors[index],
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.orange)
              ),
            ),
          ),
        );
      },
          //separatorBuilder: (context, index) => Divider(color: Colors.black,thickness: 5),
          itemCount: colors.length),
    );
  }
}
