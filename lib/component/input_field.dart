import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class InputField extends StatelessWidget {

  final String text;
  final controller;
  final String hint;
  final Widget? widget;
  final function;




  InputField({required this.text, this.controller,required this.hint,this.widget,this.function});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0,top: 10),
          child: Text(text,style: TextStyle(fontSize: 18.sp),),
        ),
        Container(
          height: 50.h,
          margin: const EdgeInsets.only(top: 4.0),
          padding: const EdgeInsets.only(left: 14),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(4)),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  readOnly: widget == null ? false : true,
                  autofocus: false,
                  controller: controller,
                  onFieldSubmitted: function,
                  decoration: InputDecoration(
                    hintText: hint,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 0,color: Colors.white),
                    ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 0,color: Colors.white)
                      )
                    ),

                ),
              ),
              widget == null
                  ? Container()
                  : Container(
                child: widget,
              )
            ],
          ),
        ),
      ],
    );
  }
}
