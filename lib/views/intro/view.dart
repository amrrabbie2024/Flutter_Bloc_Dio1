import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfirsttask/core/logic/cash_helper.dart';
import 'package:flutterfirsttask/core/logic/helper_methods.dart';
import 'package:flutterfirsttask/views/login/view.dart';

class MyIntroView extends StatefulWidget {
  const MyIntroView({super.key});

  @override
  State<MyIntroView> createState() => _MyIntroViewState();
}

final List<String> images=["img1.jpg","img2.jpg","img3.jpg","img4.jpg","img5.jpg"];

final List<String> titles=["First title","Second title","Third title","Four title","Five title"];

final List<String> descs=["First Description\ndsdsgfdhghghj fgfhfghfgh","Second Description\ndsdsgfdhghghj fgfhfghfgh","Third Description\ndsdsgfdhghghj fgfhfghfgh",
  "Four Description\ndsdsgfdhghghj fgfhfghfgh","Five Description\ndsdsgfdhghghj fgfhfghfgh"];

int currentIndex=0;

class _MyIntroViewState extends State<MyIntroView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset("assets/images/"+images[currentIndex],width: double.infinity,height: double.infinity,fit: BoxFit.fill,),
          Positioned(
            top: 40.h,
              right: 30.w,
              child: InkWell(
                onTap: () {
                  CashHelper.saveIntroStatus(true);
                  navigateTo(LoginView(),withHistory: false);
                },
                child: Container(
                  padding: EdgeInsetsDirectional.all(8.r),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Theme.of(context).primaryColor,width: 2.w)
                  ),
                  child: Text("Skip",style: TextStyle(color: Theme.of(context).primaryColor),),
                ),
              )
          ),
          Positioned(
              bottom: 110.h,
              child: Text(titles[currentIndex],style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 26,fontWeight: FontWeight.w600),)),
          Positioned(
              bottom: 60.h,
              child: Text(descs[currentIndex],style: TextStyle(color: Theme.of(context).primaryColor.withOpacity(.3),fontSize: 21,fontWeight: FontWeight.w500),)),
          Positioned(
            bottom: 110.h,
              right: 15.w,
              child: InkWell(
                onTap: () {
                  if(currentIndex == images.length-1) {
                    CashHelper.saveIntroStatus(true);
                    navigateTo(LoginView(),withHistory: false);
                  }else{
                    setState(() {
                      currentIndex++;
                    });
                  }
                },
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.orange,
                  child:  Icon(Icons.navigate_next_outlined,color: Theme.of(context).primaryColor,),
                ),
              )
          ),
          Positioned(
              bottom: 110.h,
              left: 15.w,
              child: InkWell(
                onTap: () {
                  setState(() {
                    if(currentIndex != 0)
                    currentIndex--;
                  });
                },
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: currentIndex==0?Colors.transparent:Colors.grey.withOpacity(.1),
                  child:Icon(Icons.arrow_back_ios_sharp,color: currentIndex==0?Colors.transparent:Colors.grey,),
                ),
              )
          ),
          Positioned(
            bottom: 20.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(images.length, (index) {
                    return CircleAvatar(radius: 13,backgroundColor: currentIndex==index?Colors.orange:Colors.transparent,child: CircleAvatar(radius: 10,backgroundColor: currentIndex==index?Theme.of(context).primaryColor:Colors.grey,));
                  })
                ],
              )
          ),
        ],
      ),
    );
  }
}
