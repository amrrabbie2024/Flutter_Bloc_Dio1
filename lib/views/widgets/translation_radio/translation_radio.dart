import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_thimar/core/logic/cash_helper.dart';

class ChangeLanguageWidget extends StatefulWidget {
  const ChangeLanguageWidget({super.key});

  @override
  State<ChangeLanguageWidget> createState() => _ChangeLanguageWidgetState();
}

late List<String> list;

final languages=["en","ar","fr"];

int selectedValue=0;



class _ChangeLanguageWidgetState extends State<ChangeLanguageWidget> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          String lange=CashHelper.getLanguage();
          if(lange == "en")
            selectedValue=0;
          else if(lange == "ar")
            selectedValue=1;
          else
            selectedValue=2;
          list=["english".tr(),"arabic".tr(),"france".tr()];
          return SingleChildScrollView(
            padding: EdgeInsetsDirectional.only(start: 16.r,end: 16.r,top: 24.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("select_language".tr(),style: TextStyle(color: Colors.blue,fontSize: 24),),
                SizedBox(height: 24.h,),
                ...List.generate(list.length, (index) =>
                Row(
                  children: [
                    Radio(
                      activeColor: Colors.orange,
                      value: index, groupValue: selectedValue, onChanged: (value) {
                      selectedValue=value!;
                      context.setLocale(Locale(languages[value]));
                      CashHelper.saveLanguage(languages[value]);
                      setState(() {

                      });
                    },),
                    SizedBox(width:16.w),
                    GestureDetector(
                      onTap: () {
                        selectedValue=index;
                        context.setLocale(Locale(languages[index]));
                        CashHelper.saveLanguage(languages[index]);
                        setState(() {

                        });
                      },
                        child: Text(list[index],style: TextStyle(color: Colors.red,fontSize: 20),))
                  ],
                ))

              ],
            ),
          );
        }
      ),
    );
  }
}
