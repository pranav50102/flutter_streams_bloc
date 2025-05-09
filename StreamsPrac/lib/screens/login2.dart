
import 'package:flutter/material.dart';
import 'package:streamsprac/bloc/appointmentbloc/appointment_bloc.dart';
import 'package:streamsprac/bloc/loginbloc/login_bloc.dart';
import 'package:streamsprac/screens/login.dart';


class Login2 extends StatefulWidget {
  const Login2({super.key});

  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {



  @override
  Widget build(BuildContext context) {

    var log = ModalRoute.of(context)!.settings.arguments as Map;
    var loginBloc = log["bloc"] as LoginBloc;

    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<LoginState>(
          stream: loginBloc.appointmentStream,
          builder: (context, snapshot) {
            print("login2");
            print(snapshot.data);
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if(snapshot.data is LoginSuccess)
                    Column(
                      children: [
                        Text(snapshot.data!.loginResponse.userDetails!.firstName.toString()),
                        Text(snapshot.data!.loginResponse.userDetails!.lastName.toString()),
                        Text("UserId : ${snapshot.data!.loginResponse.userDetails!.userId.toString()}"),
                        Text("Hospitalid : ${snapshot.data!.loginResponse.userDetails!.hospitalId.toString()}"),
                        Text("Fiscalyearid : ${snapshot.data!.loginResponse.userDetails!.fiscalYearId.toString()}"),
                      ],
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}