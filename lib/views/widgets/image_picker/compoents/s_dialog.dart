part of '../simple_dialog.dart';
class MSimpleDialog extends StatefulWidget {
  const MSimpleDialog({super.key});

  @override
  State<MSimpleDialog> createState() => _MSimpleDialogState();
}

class _MSimpleDialogState extends State<MSimpleDialog> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: SimpleDialog(
        title: Center(child: Text("Select Image Source")),
        titleTextStyle: TextStyle(color: Colors.red),
        backgroundColor: Colors.grey,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
          borderSide: BorderSide(color: Colors.red)
        ),
        children: [
          SizedBox(height: 16.h,),
          FilledButton(onPressed: () async {
            XFile? image=await ImagePicker().pickImage(source: ImageSource.gallery);
            Navigator.pop(context,image?.path);
          }, child: Text("From gallery ...")),
          SizedBox(height: 16.h,),
          FilledButton(onPressed: () async {
            XFile? image=await ImagePicker().pickImage(source: ImageSource.camera);
            Navigator.pop(context,image?.path);
          }, child: Text("From Camera ...")),
        ],
      ),
    );
  }
}
