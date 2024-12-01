import 'package:flutter/material.dart';

class MyCheckboxListTile extends StatefulWidget {
  const MyCheckboxListTile({super.key});

  @override
  State<MyCheckboxListTile> createState() => _MyCheckboxListTileState();
}

bool isChecked=false;

class _MyCheckboxListTileState extends State<MyCheckboxListTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CheckboxListTile(
          activeColor: Colors.blue,
          checkColor: Colors.green,
          checkboxShape: CircleBorder(
            side: BorderSide(color: Colors.brown)
          ),
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked=value!;
            });
          },
          title: Text("Hello world!"),
          subtitle: Text("Hello Flutter!"),
          secondary: Icon(Icons.add_alert),
        ),
      ),
    );
  }
}
