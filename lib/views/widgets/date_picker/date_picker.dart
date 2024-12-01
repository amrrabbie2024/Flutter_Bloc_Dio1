import 'package:flutter/material.dart';
import 'package:flutter_thimar/core/design/app_input.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({super.key});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}



 DateTime? date;

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FilledButton(onPressed: () async {
              date=await showDatePicker(context: context,
                  initialDate: DateTime.now().add(Duration(days: 1)),
                  firstDate: DateTime.now().add(Duration(days: 1)),
                  lastDate: DateTime.now().add(Duration(days: 16)));
              setState(() {

              });
            }, child: Text("show Date",)),
            SizedBox(height: 16,),
            //if(date != null)Center(child: Text( date.toString().split(" ").first,)),
            //if(date != null)Text(DateFormat.yMd().format(date!)),
            if(date != null)Center(child: Text(DateFormat.yMMMd().format(date!))),
            //if(date != null)Text(DateFormat("EEE, MMM d, ''yy").format(date!)),
          ],
        ),
      ),
    );
  }
}
