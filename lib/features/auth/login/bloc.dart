import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_thimar/core/logic/cash_helper.dart';
import 'package:flutter_thimar/core/logic/dio_helper.dart';
import 'package:flutter_thimar/core/logic/helper_methods.dart';
import 'package:flutter_thimar/views/main/home_nav/view.dart';

part 'events.dart';
part 'model.dart';
part 'states.dart';

/*class LoginBloc extends Bloc<LoginEvents,LoginStates>{
  LoginBloc():super(LoginStates()){
    on<MakeLoginEvent> (login);
  }


  Future<void> login(MakeLoginEvent event, Emitter<LoginStates> emit) async {
    emit(LoginLoadingState());
    await Future.delayed(Duration(seconds: 3));
    //emit(LoginFailedState(msg: "Login failed,try again"));
    emit(LoginSucessState(msg: "Login sucess", email: event.email, password: event.password));
  }
}*/

class LoginBloc extends Bloc<LoginEvents,LoginStates>{
  LoginBloc():super(LoginStates()) {
    on<SendLoginEvent> (_login);
  }

  Future<void> _login(SendLoginEvent event, Emitter<LoginStates> emit) async {
    emit(LoginLoadingState());
    //await Future.delayed(Duration(seconds: 3));

    String token="test";
    //String token=await FirebaseMessaging.instance.getToken()??"test";

    final response = await DioHelper.send("login", data: {
      "phone": "${event.countryCode}${event.mobile}",
      "password": event.password,
      //"device_token": token,
      "device_token":"test",
      //"type": Platform.operatingSystem??"web",
      "type":"android",
      "user_type": "client"
    });

    if (response.isSucess) {
      final model = UserData.fromJson(response.data);
      print(model.userModel.token);
      model.userModel.deviceToken=token;
      CashHelper.saveUserData(model.userModel);
      emit(LoginSucessState(msg: response.msg));
    }
    else
      emit(LoginFailedState(msg: response.msg));
  }
}