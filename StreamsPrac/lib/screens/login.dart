import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:material_text_fields/theme/material_text_field_theme.dart';
import 'package:streamsprac/bloc/loginbloc/login_bloc.dart';
import 'package:streamsprac/models/modelsInput.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();

  LoginBloc loginBloc = LoginBloc();


 @override
  Widget build(BuildContext context) {
    var viewWidth = MediaQuery.of(context)
        .size
        .width;
    var viewHeight = MediaQuery.of(context)
        .size
        .height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: viewWidth,
          color: Colors.blue,
          height: viewHeight,
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: viewWidth,
                  color: Colors.blue,
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "DocNyle",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: viewWidth,
                  padding: EdgeInsets.only(bottom: 30.0),
                  color: Colors.blue,
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Sign in to get started",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  width: viewWidth,
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: viewWidth,
                        margin: const EdgeInsets.only(
                            top: 5.0, left: 0.0, right: 0.0, bottom: 5.0),
                        child: MaterialTextField(
                          controller: textEditingController1,
                          keyboardType: TextInputType.text,
                          hint: "Email/Mobile number",
                          labelText: "Email/Mobile number",
                          textInputAction: TextInputAction.next,
                          prefixIcon: const Icon(Icons.person),
                          theme: FilledOrOutlinedTextTheme(
                              enabledColor: Colors.grey,
                              focusedColor: Colors.blueAccent,
                              fillColor: Colors.transparent,
                              radius: 10,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 4),
                              errorStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              floatingLabelStyle: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                              width: 1.5),
                        ),
                      ),
                      Container(
                        width: viewWidth,
                        margin: const EdgeInsets.only(
                            top: 5.0, left: 0.0, right: 0.0, bottom: 5.0),
                        child: MaterialTextField(
                          controller: textEditingController2,
                          keyboardType: TextInputType.visiblePassword,
                          hint: "Password",
                          labelText: "Password",
                          textInputAction: TextInputAction.next,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.visibility,
                            ),
                            onPressed:(){},
                            // Toggle visibility
                          ),
                          //const Icon(Icons.visibility),
                          theme: FilledOrOutlinedTextTheme(
                              enabledColor: Colors.grey,
                              focusedColor: Colors.blueAccent,
                              fillColor: Colors.transparent,
                              radius: 10,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 4),
                              errorStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              floatingLabelStyle: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                              width: 1.5),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          width: viewWidth,
                          margin: EdgeInsets.only(
                              top: 0.0, left: 0.0, right: 0.0, bottom: 5.0),
                          child: Text(
                            "Reset Password?",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                              color: Colors.black,
                              fontSize: 15.0.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: viewWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.blue,
                        ),
                        margin: const EdgeInsets.only(
                            top: 10.0, left: 0.0, right: 0.0, bottom: 5.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              elevation: 0,
                            ),
                            onPressed: () {
                              if(textEditingController1.text.isNotEmpty&&textEditingController2.text.isNotEmpty){
                                var hash = sha256.convert(utf8.encode(textEditingController2.text));
                                var hash1 = sha256.convert(utf8.encode(textEditingController1.text));
                                loginBloc.eventCall(LoginInput(isMobile: true, email: "null", mobileNo: textEditingController1.text, password: hash.toString(), hashValue: hash1.toString()));
                                StreamSubscription s = loginBloc.appointmentStream.listen((val){
                                  if(val is LoginSuccess){
                                    Navigator.pushReplacementNamed(context, "/login2",
                                       arguments:  {
                                          'bloc' : loginBloc,
                                        }
                                        );
                                  }
                                  else if(val is LoginFailure){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(val.loginResponse.message.toString()),
                                          duration: Duration(seconds: 3),
                                        )
                                    );
                                  }
                                  else if(val is LoginError){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(val.loginResponse.message.toString()),
                                          duration: Duration(seconds: 3),
                                        )
                                    );
                                  }
                                  else if(val is LoginLoading){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text("loading..."),
                                          duration: Duration(seconds: 3),
                                        )
                                    );
                                  }
                                });
                                s.onData((val){
                                  print('listened');
                                });
                              }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Phone no or Password is empty'),
                                      duration: Duration(seconds: 3),
                                    )
                                );

                              }
                            },
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
