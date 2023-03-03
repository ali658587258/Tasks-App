import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../src/theme.dart';

class ContainerCardProfile extends StatelessWidget {
  final IconData iconData;
  final IconData iconData1;
  final String name;
  final function;


  ContainerCardProfile({required this.iconData, required this.name,required this.iconData1,required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: SizedBox(
        width: double.infinity,
        height: 65.h,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:KmainColor.withOpacity(1),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(iconData,color: Colors.white),
                SizedBox(
                  width: 20,
                ),
                Expanded(child: Text(name,style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w400),)),
                Icon(iconData1,color: Colors.white,),
                SizedBox(
                  width: 7,
                )
              ],
            ),

          ),
        ),
      ),
    );;
  }
}
