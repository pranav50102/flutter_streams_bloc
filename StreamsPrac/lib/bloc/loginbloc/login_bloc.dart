import 'dart:async';

import 'package:meta/meta.dart';
import 'package:streamsprac/models/modelsInput.dart';
import 'package:streamsprac/models/modelsResponse.dart';
import 'package:streamsprac/util/apiService.dart';

part 'login_state.dart';

class LoginBloc  {
  ApiService apiService = new ApiService();

  StreamController<LoginState> streamController = StreamController();
  Stream<LoginState> get appointmentStream => streamController.stream.asBroadcastStream();


  void eventCall(LoginInput loginInput) async{


    streamController.sink.add(LoginLoading());
    try{
      final data = await apiService.login(loginInput);
      if(data["Status"] == 1){
        LoginResponse loginResponse = LoginResponse.fromJson(data);
        print(loginResponse.userDetails!.firstName);
        streamController.sink.add(LoginSuccess(loginResponse: loginResponse));
      }
      else if(data["Status"] == 0){
        LoginResponse loginResponse = LoginResponse.fromJson(data);
        streamController.sink.add(LoginFailure(loginResponse: loginResponse));
      }
      else{
        String message = data["Message"];
        streamController.sink.add(LoginError(message: message));
      }
    }
    catch(e){
      print(e);
      streamController.sink.add(LoginError(message: e.toString()));
    }
  }

  void disp(){
    streamController.close();
  }
}
