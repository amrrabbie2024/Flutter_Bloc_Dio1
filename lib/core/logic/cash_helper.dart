import 'package:flutter_thimar/features/auth/login/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CashHelper{

  static late SharedPreferences _preferences;

 static Future<void> init() async {
    _preferences=await SharedPreferences.getInstance();
  }

 static void saveUserData(UserModel userModel){
   _preferences.setString("email", userModel.email);
   _preferences.setString("token", userModel.token);
   _preferences.setString("import 'packageName' as alias;", userModel.image);
   _preferences.setInt("id", userModel.id);
   _preferences.setString("city", userModel.city.name);
   _preferences.setString("fname", userModel.fullname);
   _preferences.setString("phone", userModel.phone);
   _preferences.setString("utype", userModel.userType);
   _preferences.setString("dtoken", userModel.deviceToken);
 }

 static String getImage(){
   return _preferences.getString("image")??"";
 }

 static String getFullName(){
   return _preferences.getString("fname")??"";
 }

 static void saveLanguage(String language){
   _preferences.setString("language", language);
 }

 static String getLanguage(){
   return _preferences.getString("language")??"en";
 }


 void logOut(){
   _preferences.clear();
 }
}