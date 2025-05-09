import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamsprac/bloc/loginbloc/login_bloc.dart';
import 'package:streamsprac/screens/appointments.dart';
import 'package:streamsprac/screens/login.dart';
import 'package:streamsprac/screens/login2.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: {
          '/' : (context) => Appointment(),
          '/login' : (context) => Login(),
          '/login2' : (context) => Login2(),
        },
      ),
    );
  }
}
