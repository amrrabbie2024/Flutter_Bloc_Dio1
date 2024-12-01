import 'package:flutter/material.dart';
import 'package:flutter_thimar/core/logic/helper_methods.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

final formKey=GlobalKey<FormState>();

final emailController=TextEditingController();
final phoneController=TextEditingController();

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsetsDirectional.only(top: 24,start: 16,end: 16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if(value!.isEmpty)
                    return "Must enter Phone number";
                  else
                    return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.green
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                          color: Colors.blue
                      )
                  ),
                   enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(25),
                       borderSide: BorderSide(
                           color: Colors.red
                       )
                   ),
                ),
              ),
              SizedBox(height: 16,),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if(value!.isEmpty)
                    return "Must enter Email address";
                  else
                    return null;
                },
              ),
              SizedBox(height: 16,),
              FilledButton(onPressed: () {
                if(formKey.currentState!.validate()){
                  showMessage("${phoneController.text}\n${emailController.text}",isSucess: true);
                }
              }, child: Text("Send data ..."))
            ],
          ),
        ),
      ),
    );
  }
}
