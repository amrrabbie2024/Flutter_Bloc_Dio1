
part of '../../view.dart';
class DropDownListCitiesSection extends StatefulWidget {
  const DropDownListCitiesSection({super.key});

  @override
  State<DropDownListCitiesSection> createState() => _DropDownListCitiesSectionState();
}

String? selected_value;

final kbloc=KiwiContainer().resolve<Citiesbloc>()..add(GetCitiesEvent());

class _DropDownListCitiesSectionState extends State<DropDownListCitiesSection> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: kbloc,
        builder: (context, state) {
          if(state is GetCitiesFailedState)
            return Center(child: Text(state.msg,style: TextStyle(color: Colors.red,fontSize: 32),));
          else if(state is GetCitiesSucessState){
            return DropdownButton(
              itemHeight: 60,
              isExpanded: true,
              icon: Icon(Icons.access_time_filled),
              iconEnabledColor: Colors.green,
              hint: Text("Select city",style: TextStyle(color: Colors.red,fontSize: 18),),
              borderRadius: BorderRadius.circular(25),
              underline: SizedBox(),
              dropdownColor: Colors.yellow,
              focusColor: Colors.orange,
              value: selected_value,
              items:
              List.generate(state.list.length, (index) =>
                  DropdownMenuItem(child: _itemDDB(state.list[index].name),value: state.list[index].id,))
              , onChanged: (value) {
              selected_value=value;
              setState(() {

              });
            },);
          }else{
            return Center(child: CircularProgressIndicator());
          }
        }, listener: (context, state) {

        },);
  }

Widget  _itemDDB(String name) {
    return Text(name,style: TextStyle(color: Colors.blue,fontSize: 21),);
}
}
