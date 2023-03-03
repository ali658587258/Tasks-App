import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerCard extends StatelessWidget {
final Color color;
final IconData iconData;
final String text;
final function;

ContainerCard({required this.color, required this.iconData,required this.text,required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          width: 110.w,
          height: 100.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                  child: Icon(iconData),
                ),

                Text(text,style: TextStyle(fontSize: 12.sp,),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
