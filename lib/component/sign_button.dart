import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../src/theme.dart';

class SignButton extends StatelessWidget {
  final String text;
  final String text1;
  final function;

  SignButton({required this.text, required this.function,required this.text1});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 50.h,
        child: ElevatedButton(onPressed: function,
            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all(white),
              shape: MaterialStateProperty.all<
                  RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.black12),
                    borderRadius:
                    BorderRadius.circular(10.0),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text,style: TextStyle(color: Colors.black38),),
                Text(text1,style: TextStyle(color: KmainColor))
              ],
            )
        ),
      ),
    );
  }
}
