part of '../view.dart';
class SliderSection extends StatefulWidget {
  const SliderSection({super.key});

  @override
  State<SliderSection> createState() => _SliderSectionState();
}

int currentPage=0;

/*final list=[
  "egypt.jpg", "logo.jpg", "egypt.jpg", "logo.jpg", "egypt.jpg", "logo.jpg","egypt.jpg", "logo.jpg"
];*/

//final bloc=KiwiContainer().resolve<SliderBloc>()..add(GetSliderEvent());
final bloc=GetIt.I<SliderBloc>()..add(GetSliderEvent());

class _SliderSectionState extends State<SliderSection> {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
      if(state is GetSliderFailedData)
        return AppFailed(msg: state.msg);
      else if (state is GetSliderSucessData){
        return Column(
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  //aspectRatio: 1
                  onPageChanged: (index, reason) {
                    currentPage = index;
                    setState(() {

                    });
                  },
                ),
                itemCount: state.list.length,
                itemBuilder: (BuildContext context, int itemIndex,
                    int pageViewIndex) =>
             ClipRRect(
               borderRadius: BorderRadius.circular(25),
               child: AppImage(state.list[itemIndex].media,
                          width: double.infinity,
                          height: 180.h,
                          fit: BoxFit.fill,),
             ),
                    
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(state.list.length, (index) =>
                    Padding(
                      padding:  EdgeInsetsDirectional.only(end: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                color: index==currentPage?Colors.black:Colors.transparent
                            )
                        ),
                        child: CircleAvatar(radius: 10,backgroundColor: index==currentPage?Theme.of(context).primaryColor:Colors.grey,
                        ),
                      ),
                    )
                ),
              )
            ]
        );
      }else
        return AppLoading();
    },);
  }
}
