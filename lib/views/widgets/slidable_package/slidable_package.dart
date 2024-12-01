import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_thimar/views/widgets/dismisible/dismisible.dart';

class SlidablePackageWidget extends StatefulWidget {
  const SlidablePackageWidget({super.key});

  @override
  State<SlidablePackageWidget> createState() => _SlidablePackageWidgetState();
}

int selectedValue=0;

final  colors=[Colors.red,Colors.green,Colors.yellow,Colors.blue,Colors.grey];

class _SlidablePackageWidgetState extends State<SlidablePackageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        return Slidable(
          key: ValueKey(currentValue),
          endActionPane: ActionPane(
            // motion: const ScrollMotion(),
            motion: const BehindMotion(),
            children: [
              SlidableAction(
              
                onPressed: (context) {
                  colors.removeAt(index);
                  setState(() {
              
                  });
                },
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
                flex: 2,
                spacing: 32,
                borderRadius: BorderRadius.circular(25),
              ),
              SlidableAction(

                onPressed: (context) {

                },
                backgroundColor: Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.share,
                label: 'Share',
                borderRadius: BorderRadius.circular(25),
                flex: 3,
              ),
            ],
          ) ,
          child: GestureDetector(
            onTap: () {
              selectedValue=index;
              setState(() {
          
              });
            },
            child: Container(
              width: double.infinity,
              height: 150.h,
              decoration: BoxDecoration(
                color: colors[index],
                borderRadius: BorderRadiusDirectional.circular(25),
                border: Border.all(color: selectedValue==index?Colors.black:Colors.transparent)
              ),
            ),
          ),
        );
      },itemCount: colors.length,),
    );
  }
}
