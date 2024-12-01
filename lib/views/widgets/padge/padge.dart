import 'package:flutter/material.dart';

class PadgeWidget extends StatelessWidget {
  const PadgeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Badge(
        alignment: AlignmentDirectional.topCenter,
        label: Text("5"),
        //largeSize: 48,
        textColor: Colors.red,
        textStyle: TextStyle(fontWeight: FontWeight.w700),
        backgroundColor: Colors.green,
        //padding: EdgeInsets.all(8),
        child: Container(
          width: 150,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(25)
          ),
        ),
      ),
    );
  }
}
