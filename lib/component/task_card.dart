import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TaskCard extends StatelessWidget {

  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final String states;
  final function;
  final Color color;
  String posation;



  TaskCard({
    required this.posation,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.states,
    this.function,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: function,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(bottom: 12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: color,
            ),
            child: Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(title,style: TextStyle(fontSize: 20.sp,color: Colors.white),),

                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.date_range,
                              color: Colors.white,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text('$startDate',style: TextStyle(color: Colors.white),),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.date_range,
                              color: Colors.white,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text('$endDate',style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(description,style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 60,
                width: 0.5,
                color: Colors.grey[200]!.withOpacity(0.7),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Text(states,style: TextStyle(color: Colors.white),),
              ),
            ]),
          ),
        ),
      );
  }
}
