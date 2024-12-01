import 'package:flutter/material.dart';
import 'package:flutter_thimar/core/design/app_loading.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPress;

  final bool isLoadin;
  const AppButton({super.key, required this.text, this.onPress,  this.isLoadin=false});

  @override
  Widget build(BuildContext context) {
    if(isLoadin)
      return AppLoading();
   else return FilledButton(onPressed: onPress, child: Text(text,
    style: TextStyle(fontSize: 21,fontWeight: FontWeight.w700),)) ;
  }
}
