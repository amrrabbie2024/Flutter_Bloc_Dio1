import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInput extends StatefulWidget {

  final String labelText;
  final IconData? prefixIcon,suffixIcon;
  final VoidCallback? onTap;

  final  bool isHide;

  final bool isPhone;

  final String? Function(String? value)? validator;

  final TextEditingController? controller;

  final TextInputType? keyboardType;


  const AppInput({super.key,  this.labelText="", this.prefixIcon, this.suffixIcon, this.onTap,this.validator, this.isHide=false,  this.isPhone=false, this.controller, this.keyboardType});

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: TextFormField(

        obscureText: widget.isHide,
        keyboardType: widget.keyboardType,
        inputFormatters: [
          if(widget.isPhone)FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
         /* icon: widget.isPhone?Container(
            padding: EdgeInsets.all(8.r),
            child: Column(
              children: [
                Icon(Icons.flag_rounded,color: Theme.of(context).primaryColor,),
                SizedBox(height: 16.h,),
                Text("+20",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 18),)
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: Colors.yellow)
            ),
          ):null,*/
          labelText: widget.labelText,
          prefixIcon: Icon(widget.prefixIcon,color: Theme.of(context).primaryColor,),
          suffixIcon: GestureDetector(
              onTap: widget.onTap,
              child: Icon(widget.suffixIcon,color: Theme.of(context).primaryColor,))
        ),
        validator: widget.validator,
        controller: widget.controller,
      
      ),
    );
  }
}
