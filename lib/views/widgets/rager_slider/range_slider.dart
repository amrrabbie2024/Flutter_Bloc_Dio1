import 'package:flutter/material.dart';

class RangerSliderWidget extends StatefulWidget {
  const RangerSliderWidget({super.key});

  @override
  State<RangerSliderWidget> createState() => _RangerSliderWidgetState();
}

RangeValues values=RangeValues(15,45);

class _RangerSliderWidgetState extends State<RangerSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return  Center(
        child: RangeSlider(
          values: values,
          min: 0,
          max: 100,
          divisions: 20,
          activeColor: Colors.orange,
          inactiveColor: Colors.yellow,
          labels: RangeLabels(values.start.toString(),values.end.toString()),

          onChanged: (value) {
            values=value;
            setState(() {

            });
          },
        ),
    );
  }
}
