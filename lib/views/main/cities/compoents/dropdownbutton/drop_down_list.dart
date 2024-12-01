
part of '../../view.dart';
class DropDownListSection extends StatefulWidget {
  const DropDownListSection({super.key});

  @override
  State<DropDownListSection> createState() => _DropDownListSectionState();
}

final list=["cairo","mansoura","alex","tanta"];
final listvalues=[0,1,2,3];
int? selectedValue;

class _DropDownListSectionState extends State<DropDownListSection> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedValue,
      isExpanded: true,
      hint: Text("Select city",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w600,fontSize: 16),),
      icon: Icon(Icons.accessibility_new),
      dropdownColor: Colors.grey,
      focusColor: Colors.yellow,
      iconEnabledColor: Colors.green,
      iconDisabledColor: Colors.orange,
      itemHeight: 90,
      padding: EdgeInsets.symmetric(horizontal: 16),
      borderRadius: BorderRadius.circular(16),
      underline: SizedBox(),
      items:
      List.generate(list.length, (index) =>
      DropdownMenuItem(child: _item(list[index]),value: listvalues[index],))
      , onChanged: (value) {
      selectedValue=value;
      setState(() {

      });
    },);
  }

  Widget _item(String text){
    return Text(text,style: TextStyle(color: Colors.blue,fontSize: 18),);
  }
}
