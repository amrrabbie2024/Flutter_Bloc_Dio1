import 'package:flutter/material.dart';

class TextRichWidget extends StatelessWidget {
  const TextRichWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'Hello ',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w400,fontSize: 21)),
              TextSpan(text: ' world!',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w700,fontSize: 24)),
            ],
          ),
        )
      ),
    );
  }
}
