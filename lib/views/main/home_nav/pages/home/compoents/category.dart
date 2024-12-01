part of '../view.dart';
class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}
final categbloc=KiwiContainer().resolve<CategoriesBloc>()..add(GetCategoriesEvent());
//final catebloc=GetIt.I<GetCategoriesEvent>();

class _CategoriesSectionState extends State<CategoriesSection> {





  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: categbloc,
        builder: (context, state) {
          if(state is GetCategoriesFailedState)
            return AppFailed(msg: state.msg);
          else if(state is GetCategoriesSucessState){
          return  SizedBox(
              height: 105.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                          child: AppImage(state.list[index].media,width: 72,height: 72,)),
                      SizedBox(height: 8.h,),
                      Text(state.list[index].name??"",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500,color: Colors.blue),)
                    ],
                  );
                }, separatorBuilder: (context, index) => SizedBox(width: 8.w,), itemCount: state.list.length));
          }else
            return AppLoading();
        },
    );
  }
}
