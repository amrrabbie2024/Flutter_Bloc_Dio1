import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfirsttask/core/design/app_failed.dart';
import 'package:flutterfirsttask/core/design/app_loading.dart';
import 'package:flutterfirsttask/core/logic/helper_methods.dart';
import 'package:flutterfirsttask/features/news_eg/bloc.dart';
import 'package:get_it/get_it.dart';

class MyNewsEg extends StatefulWidget {
  const MyNewsEg({super.key});

  @override
  State<MyNewsEg> createState() => _MyNewsEgState();
}

final gbloc=GetIt.I<MNewsBloc>();
String? country_code;
List<String> countries=["eg","sa","ae","us","ru"];
int? currentValue;

class _MyNewsEgState extends State<MyNewsEg> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w,vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButton(
                isExpanded: true,
                underline: SizedBox(),
                autofocus: true,
                focusColor: Colors.green.withOpacity(.2),
                hint: Text("Select country code",style: TextStyle(color: Colors.red,fontSize: 24),),
                icon: Icon(Icons.arrow_circle_down_rounded,color: Colors.red,),
                iconSize: 16,
                borderRadius: BorderRadius.circular(16),
                dropdownColor: Colors.yellow,
                value: currentValue,
                items: List.generate(countries.length, (index) =>
              DropdownMenuItem(child: Text(countries[index],style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600),),
                value: index,
              )
              )
                , onChanged: (value) {
                setState(() {
                  currentValue=value!;
                  country_code=countries[currentValue!];
                  print(country_code);
                });
              },),
              SizedBox(height: 16,),
              BlocConsumer(
                bloc: gbloc,
                buildWhen: (previous, current) => current is MNewsFailedState || current is MNewsSucessState || current is MNewsLoadingState,
                listener: (context, state) {
                  if(state is MNewsFailedState)
                    showMessage(state.msg);
                  else if(state is MNewsSucessState)
                    showMessage("Items:- ${state.articles.length}",isSucess: true);
                },
                builder: (context, state) {
                  if(state is MNewsLoadingState)
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _MyButton(),
                        SizedBox(height: 16.h,),
                        AppLoading()
                      ],
                    );
                  else if(state is MNewsFailedState)
                    return  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _MyButton(),
                        SizedBox(height: 16.h,),
                        AppFailed(msg: state.msg,)
                      ],
                    );
                  else if(state is MNewsSucessState)
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _MyButton(),
                        SizedBox(height: 16.h,),
                        _MyList(state.articles)
                      ],
                    );
                  else
                    return _MyButton();
                },
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: BlocBuilder(
                  bloc: gbloc,
                  //buildWhen: (previous, current) => current is MNewsPaginationState || current is MNewsPaginationFinishedState,
                  builder: (context, state) {
                    if(state is MNewsPaginationState)
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 8.h,),
                          Text("Loading ...",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)
                        ],
                      );
                    else if(state is MNewsPaginationFinishedState)
                      return Center(child:  Text("No items found",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w600,fontSize: 22),),);
                    else return SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _MyButton(){
    return SizedBox(
      height: 40.h,
      child: FilledButton(
          style: FilledButton.styleFrom(
              backgroundColor: Colors.green.withOpacity(.2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.green)
              )
          ),
          onPressed: () {
            if(country_code != null){
              gbloc.add(getMNewsDataEvent(country_code: country_code!));
            }else{
              showMessage("Must select country code");
            }
          }, child: Text("get Data ...",style: TextStyle(color: Colors.blue),)),
    );
  }

 Widget _MyList(List<MArticles> articles) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if(notification.metrics.pixels == notification.metrics.maxScrollExtent && notification is ScrollUpdateNotification){
          if(country_code !=null) {
            gbloc.add(getMNewsDataEvent(country_code: country_code!));
          }
        }
        return true;
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 196,
        child: ListView.separated(
            itemBuilder: (context, index) => _item(articles[index]),
            separatorBuilder: (context, index) => Divider(color: Colors.green.withOpacity(.5),thickness: 4),
            itemCount: articles.length
        ),
      ),
    );
 }

 Widget _item(MArticles articl) {
    return GestureDetector(
      onTap: () {
        showMessage(articl.title,isSucess: true);
      },
      child: Card(
        color: Colors.yellow.withOpacity(.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.green)
        ),
        child: Padding(
          padding:  EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(articl.author,style: TextStyle(color: Colors.red,fontSize: 21,fontWeight: FontWeight.w600),),
              SizedBox(height: 16.h,),
              Text(articl.title,style: TextStyle(color: Colors.blue,fontSize: 21,fontWeight: FontWeight.w600),),
              SizedBox(height: 16.h,),
              Text(articl.publishedAt.split("T").first,style: TextStyle(color: Colors.green,fontSize: 21,fontWeight: FontWeight.w600),),
            ],
          ),
        ),
      ),
    );
 }
}
