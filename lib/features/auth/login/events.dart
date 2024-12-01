part of 'bloc.dart';

/*class LoginEvents{}

class MakeLoginEvent extends LoginEvents{
  final String email,password;

  MakeLoginEvent({required this.email,required this.password});
}*/


class LoginEvents{}

class SendLoginEvent extends LoginEvents{
  String mobile,countryCode,password;

  SendLoginEvent({required this.mobile,required this.countryCode,required this.password});
}