part of 'bloc.dart';

/*class LoginStates{}

class LoginLoadingState extends LoginStates{}

class LoginFailedState extends LoginStates{
  final String msg;

  LoginFailedState({required this.msg});
}

class LoginSucessState extends LoginStates{
  final String msg,email,password;

  LoginSucessState({required this.msg,required this.email,required this.password});
}*/

class LoginStates{}

class LoginLoadingState extends LoginStates{}

class LoginFailedState extends LoginStates{
  final String msg;

  LoginFailedState({required this.msg}){
    if(msg.isNotEmpty) {
      showMessage(msg);
    }
  }

}

class LoginSucessState extends LoginStates{
  final String msg;

  LoginSucessState({required this.msg}){
    
    if(msg.isNotEmpty) {
      showMessage(msg, isSucess: true);
    }
    navigateTo(HomeNavView(),withHistory: false);
  }
}