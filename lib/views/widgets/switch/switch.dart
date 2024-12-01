import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

bool selectedValue=false;

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Switch(
          value: selectedValue,
          activeColor: Colors.orange,
          onChanged: (value) {
            selectedValue=value;
            setState(() {
      
            });
          },
        ),
      ),
    );
  }
}
