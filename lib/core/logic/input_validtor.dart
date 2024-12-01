
class InputValidtor{

  static String? email(String? value) {
    if(value!.isEmpty)
      return "Must enter email";
    else return null;
  }

  static String? password(String? value){
    if(value!.isEmpty)
      return "Must enter password";
    else if(value!.length < 8)
      return "Password must be 8 characters at least";
    else return null;

  }
}