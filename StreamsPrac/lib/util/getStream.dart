import 'package:streamsprac/bloc/loginbloc/login_bloc.dart';

class GetStream{
  LoginBloc loginBloc = LoginBloc();

  LoginBloc getStream(){
    return loginBloc;
  }
}