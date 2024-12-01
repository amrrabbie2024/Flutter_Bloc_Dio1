import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({super.key});

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

TimeOfDay? time;

class _TimePickerWidgetState extends State<TimePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FilledButton(onPressed: () async {
              time=await showTimePicker(context: context,
                  initialTime: TimeOfDay.now());
              setState(() {

              });
            }, child: Text("show Time")),
            SizedBox(height: 16.h,),
            if(time!= null)Center(child: Text("${(time!.hour>12?time!.hour-12:time!.hour).toString().padLeft(2,"0")}:${time!.minute.toString().padLeft(2,"0")} ${time!.period.name.toUpperCase()}"))
          ],
        ),
      ),
    );
  }
}
