import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';




class WidgetsNew{

  Widget loading(){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Loading...",
          style: TextStyle(
            color: Colors.orange,
            fontSize: 20,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: SpinKitWave(
            color: Colors.orange,
            size: 80.r,
          ),
        ),
      ],
    );
  }

  Widget Error(String s){
    return Center(
      child: Text('$s'),
    );
  }

}