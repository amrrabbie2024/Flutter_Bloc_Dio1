import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

double initValue=0;

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Slider(
          value: initValue,
          min: 0,
          max: 100,
          divisions: 20,
          label: initValue.toString(),
          activeColor: Colors.orange,
          inactiveColor: Colors.yellow,
          onChanged: (value) {
          initValue=value;
          setState(() {
            
          });
        },),
    );
  }
}
