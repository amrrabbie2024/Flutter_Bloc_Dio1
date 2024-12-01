import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_thimar/core/design/app_button.dart';
import 'package:flutter_thimar/core/design/app_image.dart';
import 'package:flutter_thimar/core/design/app_input.dart';
import 'package:flutter_thimar/core/logic/helper_methods.dart';
import 'package:flutter_thimar/features/auth/login/bloc.dart';
import 'package:flutter_thimar/views/auth/forgot_password/view.dart';
import 'package:flutter_thimar/views/auth/regsister/view.dart';
import 'package:kiwi/kiwi.dart';

import '../../../core/logic/input_validtor.dart';
import '../../sheets/countries.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final bloc=KiwiContainer().resolve<LoginBloc>();

  final emailController=TextEditingController(text: "55001122334455");
  final passwordController=TextEditingController(text: "123456789");

  //final bloc=GetIt.I<LoginBloc>();

  bool isHide=true;

   String countryCode="966";

  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding:  EdgeInsetsDirectional.only(start: 16,end: 16,top: 24),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(radius: 75.r,child: AppImage("logo.jpg",width: 150,height: 150,)),
              SizedBox(height: 32.h,),
              Text("Login form",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w700,color: Theme.of(context).primaryColor),),
              SizedBox(height: 16.h,),
              Text("Fill login data",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w400,color: Color(0xffbfd3c8),),),
                SizedBox(height: 16.h,),
              AppInput(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                isPhone: true,
                labelText: "email".tr(),
                prefixIcon: Icons.email,
                /*validator: (value) {
                  if(value!.isEmpty)
                    return "Must enter email";
                  else return null;
                },*/
                validator:  InputValidtor.email,
              ),
              SizedBox(height: 16.h,),
             /* TextFormField(
                controller: passwordController,
                obscureText: isHide,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  labelText: "password".tr(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16)
                  ),
                  prefixIcon: Icon(Icons.password,color: Theme.of(context).primaryColor,),
                  suffixIcon: IconButton(icon: Icon(isHide==true?Icons.hide_source:Icons.remove_red_eye_outlined,color: Theme.of(context).primaryColor,),
                  onPressed: () {
                    isHide=!isHide;
                    setState(() {

                    });
                  },)
                ),
                validator: (value) {
                  if(value!.isEmpty)
                    return "Must enter password";
                  else if(value!.length < 8)
                    return "Password must be 8 characters at least";
                  else return null;
                },
              ),*/
              AppInput(
                keyboardType: TextInputType.text,
                controller: passwordController,
                isHide: isHide,
                labelText: "password".tr(),
                prefixIcon: Icons.password,
                suffixIcon: isHide==true?Icons.hide_source:Icons.remove_red_eye_outlined,
               /* validator: (value) {
                  if(value!.isEmpty)
                    return "Must enter password";
                  else if(value!.length < 8)
                    return "Password must be 8 characters at least";
                  else return null;
                },*/
                validator: InputValidtor.password ,
                onTap: () {
                  isHide=!isHide;
                  setState(() {

                  });
                },
              ),
              SizedBox(height: 24,),
              GestureDetector(
                onTap: () {
                  navigateTo(ForgotPasswordView());
                },
                child: Align(
                  alignment: AlignmentDirectional.center,
                    child: Text("Forgot password",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: Theme.of(context).primaryColor),)),
              ),
              SizedBox(height: 16.h,),
              //BlocConsumer(
          BlocBuilder(
                bloc: bloc,
                /*listener: (context, state) {
                  if(state is LoginFailedState)
                    showMessage(state.msg);
                  else if(state is LoginSucessState){
                    showMessage(state.msg ,isSucess: true);
                  }
                },*/
                builder: (context, state) {
                  /*if(state is LoginLoadingState )
                    return AppLoading();
                  else*/
                    return AppButton(
                      isLoadin: state is LoginLoadingState,
                      text: "login".tr(),onPress: () {
                      if(formKey.currentState!.validate()){
                        bloc.add(SendLoginEvent(mobile: emailController.text, countryCode: countryCode, password: passwordController.text));
                      }
                    },);

                },
              ),
              SizedBox(height: 32.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Do not have account?",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w700,color: Theme.of(context).primaryColor),),
                  InkWell(
                    onTap: () {
                      navigateTo(RegsisterView());
                    },
                      child: Text("Sign up",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w700,color: Theme.of(context).primaryColor),)),
                ],
              ),
              SizedBox(height: 32.h,),
              GestureDetector(
                onTap: () async {
                 final result=await showModalBottomSheet(context: context, builder: (context) =>
                    CountriesSheet(),);
                 if(result != null) {
                   countryCode = result[0];
                   print(result[1]);
                   setState(() {

                   });
                 }
                },
                child: Container(
                  padding: EdgeInsets.all(8.r),
                  child: Column(
                    children: [
                      AppImage("egypt.jpg",width: 32.w,height: 24.h,),
                      SizedBox(height: 16.h,),
                      Text(countryCode,style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 18),)
                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(color: Colors.yellow),
                    //color: Colors.blue
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
