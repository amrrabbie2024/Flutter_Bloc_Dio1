part of '../simple_sheet.dart';
class MSheetDialog extends StatefulWidget {
  const MSheetDialog({super.key});

  @override
  State<MSheetDialog> createState() => _MSheetDialogState();
}

class _MSheetDialogState extends State<MSheetDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
        border: Border.all(color: Colors.red)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: Text("Slect image source",style: TextStyle(color: Colors.red),)),
          SizedBox(height: 16,),
          FilledButton(onPressed: () async {
            XFile? image=await ImagePicker().pickImage(source: ImageSource.gallery);
            Navigator.pop(context,image?.path);
          }, child: Text("From gallery ...")),
          SizedBox(height: 16,),
          FilledButton(onPressed: () async {
            XFile? image=await ImagePicker().pickImage(source: ImageSource.camera);
            Navigator.pop(context,image?.path);
          }, child: Text("From camera ...")),
        ],
      ),
    );
  }
}
