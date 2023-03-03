import 'dart:math';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';


import '../../blocs/authentication/authent_cubit.dart';
import '../../blocs/colors_app/colors_cubit.dart';
import '../../blocs/get_task/get_task_cubit.dart';
import '../../component/task_card.dart';
import '../../core/utils/app_navigator.dart';
import '../../src/theme.dart';
import '../Profile/profile_screen.dart';
import 'add_task_screen.dart';
import 'details_task_screen.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedDate = DateTime.now();
  String date = 'calender';


  void initState() {
    GetTaskCubit.get(context).getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<GetTaskCubit,GetTaskState>(
        listener: (context,state){
          },
        builder: (context,state){
      var cubit = GetTaskCubit.get(context);
      var cubitAuthentication = AuthentCubit.get(context);
      var cubitColor = ColorsCubit.get(context);
      return Scaffold(
          backgroundColor: white,
        body: cubit.respondsGetTasks == null ?
        Center(child: CircularProgressIndicator(
          color: bluishClr,
        ),): Padding(
          padding: const EdgeInsets.only(top: 40.0,right: 20,left: 20),
          child: RefreshIndicator(
            onRefresh: () async {
              cubit.getTasks();
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Text(cubitAuthentication.authentication!.user!.name!.toUpperCase(),style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w700),)),

                    GestureDetector(
                      onTap: (){
                        AppNavigator.navigateToNewScreen(context, ProfileScreen(), false);
                      },
                      child: CircleAvatar(
                        radius: 30.r,
                        backgroundImage: NetworkImage('https://as1.ftcdn.net/v2/jpg/04/81/00/50/1000_F_481005079_HYTOGwBipvktrphdgtyqbeKuQjjfOpyf.jpg'),
                      ),
                    ),

                  ],
                ),
                Divider(
                  color: Colors.grey.shade500,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 10),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(

                              DateFormat.MMMMd().format(DateTime.now()),
                              style: subHeadingStyle,
                            ),
                            Text(
                              "Today",
                              style: headingStyle,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                            onTap: (){
                              AppNavigator.navigateToNewScreen(context, AddTaskScreen(), false);
                            },
                            child: Container(
                                alignment: Alignment.center,
                                width: 120,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: KmainColor,
                                ),
                                child: Text(
                                  '+ Add Task',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.white),
                                )),
                          )
                        ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 20, left: 20),
                  child: DatePicker(
                    DateTime.now(),
                    height: 90,
                    width: 70,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: KmainColor,
                    selectedTextColor: Colors.white,
                    dateTextStyle: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    dayTextStyle: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    monthTextStyle: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    onDateChange: (date) {
                      setState(() {
                        _selectedDate = date;
                        print(_selectedDate);

                      });
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cubit.respondsGetTasks!.response!.length,
                      itemBuilder: (context,int index){
                        if (DateTime.tryParse(cubit.respondsGetTasks!.response![index].startDate!) == _selectedDate){
                          return TaskCard(
                            function: (){
                              AppNavigator.navigateToNewScreen(context, DetailsTaskScreen(id: cubit.respondsGetTasks!.response![index].id!), false);
                            },
                            color: cubitColor.colorsList[cubitColor.index!],

                            title: cubit.respondsGetTasks!.response![index].title!,
                            description: cubit.respondsGetTasks!.response![index].description!,
                            startDate: cubit.respondsGetTasks!.response![index].startDate!,
                            endDate: cubit.respondsGetTasks!.response![index].endDate!,
                            states: cubit.respondsGetTasks!.response![index].status!,
                            posation: 'calender',

                          );
                        }
                        else {
                          return TaskCard(
                            function: (){
                              AppNavigator.navigateToNewScreen(context, DetailsTaskScreen(id: cubit.respondsGetTasks!.response![index].id!), false);
                            },
                            color: cubitColor.colorsList[cubitColor.index!],

                            title: cubit.respondsGetTasks!.response![index].title!,
                            description: cubit.respondsGetTasks!.response![index].description!,
                            startDate: cubit.respondsGetTasks!.response![index].startDate!,
                            endDate: cubit.respondsGetTasks!.response![index].endDate!,
                            states: cubit.respondsGetTasks!.response![index].status!,
                            posation: 'calender',

                          );
                        }
                      }
                  ),
                )
                  ],
            ),
          ),
        ),
      );
    });
  }
}
