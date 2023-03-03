import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../src/theme.dart';

class CustomButton extends StatelessWidget {
bool active ;
String buttonName;
Icon? iconButton;
Function function;
double? width;


CustomButton(
    {
       this.active=false,
      required this.buttonName,
       this.iconButton,
      required this.function,
      this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(3),
        height: 40.h,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: active? white : Colors.grey, width: 1.5),
          color: active? KmainColor : Colors.white
         ),
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(fontSize: 18.sp),
          ),
        ),
      ),
    );
    ;
  }
}
