

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../blocs/add_tasks/add_task_cubit.dart';
import '../../component/floating_button.dart';
import '../../component/input_field.dart';
import '../../component/my_button.dart';
import '../../core/toast/toast_config.dart';
import '../../core/utils/app_navigator.dart';
import '../../enums/toast_state.dart';
import '../../src/theme.dart';
import 'home_screen.dart';

class AddTaskScreen extends StatefulWidget {


  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {


  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  int? number;
  String? myState;




  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit, AddTaskState>(listener: (context, state) {
      if(state is AddTaskSuccsessState){
        Navigator.pop(context);
        ToastConfig.showToast(msg: 'Success', toastStates: ToastStates.Success);
      }
      else if(state is AddTaskErrorState){
        ToastConfig.showToast(msg: 'Error', toastStates: ToastStates.Error);
      }

    },
      builder: (context, state) {
        var cubit = AddTaskCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
            backgroundColor: white,
            body: Padding(
            padding: const EdgeInsets.only(right: 20.0,left: 20,bottom: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text('Add Task',style: TextStyle(fontSize: 24.sp),),
                  SizedBox(
                    height: 20.h,
                  ),
                  InputField(text: 'Title',
                      controller: cubit.titleController,
                      hint: 'Enter your title'),
                  InputField(text: 'Description',
                      controller: cubit.descriptionController,
                      hint: 'Enter your description'),
                  Row(
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: InputField(
                          text: 'Start Date',
                          hint: cubit.startDataController.text,
                          widget: IconButton(
                              icon: const Icon(
                                Icons.calendar_today_outlined,
                                color: Colors.grey,
                              ),
                              onPressed: () async {
                                DateTime? pickerDate = await showDatePicker(
                                  context: context,
                                  initialDate: startDate,
                                  firstDate: DateTime(2015),
                                  lastDate: DateTime(2121),
                                );

                                if (pickerDate != null && pickerDate != startDate) {
                                  setState(() {
                                    startDate = pickerDate;
                                    String Onlydate = new DateFormat("yyyy-MM-dd").format(pickerDate);
                                    cubit.startDataController.text = '$Onlydate';
                                  });
                                } else {
                                  print("it's null or something is wrong");
                                }
                              }
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      SizedBox(
                        width: 150.w,
                        child: InputField(
                          text: 'End Date',
                          hint: cubit.endDateContruller.text,
                          widget: IconButton(
                              icon: const Icon(
                                Icons.calendar_today_outlined,
                                color: Colors.grey,
                              ),
                              onPressed: () async {
                                DateTime? pickerDate = await showDatePicker(
                                  context: context,
                                  initialDate: endDate,
                                  firstDate: DateTime(2015),
                                  lastDate: DateTime(2121),
                                );

                                if (pickerDate != null && pickerDate != endDate) {
                                  setState(() {
                                    endDate = pickerDate;
                                    String Onlydate = new DateFormat("yyyy-MM-dd").format(pickerDate);
                                    cubit.endDateContruller.text = '$Onlydate';
                                  });
                                } else {
                                  print("it's null or something is wrong");
                                }
                              }
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Reminder',style: TextStyle(fontSize: 18.sp),
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(KmainColor),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                BorderRadius.circular(10.0)
                            ),)),
                            onPressed: () async {
                              cubit.ReminderTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );

                            },
                            child: Text(
                              'Show Time Reminder',style: TextStyle(fontSize: 18.sp)
                            )),
                      )
                    ],
                  ),


                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: cubit.imageFile ==null?
                      Container():
                      Container(
                        width: double.infinity,
                        height: 250.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: FileImage(cubit.imageFile!),fit: BoxFit.fill
                          ),
                        ),
                      )
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),


                  if(state is AddTaskLoadingState )

                    LinearProgressIndicator(),
                  MyButton(text: 'Add',
                      function: (){
                    cubit.addTask();
                  }),
                  SizedBox(
                    height: 10.h,
                  )

                ],
              ),
            ),
          ),
          floatingActionButton: FloatingButton(functionGallery: (){
            cubit.imageFromGallery();
            Navigator.pop(context);
          }, functionCamer: (){
            cubit.imageFromCamera();
            Navigator.pop(context);
          })
        );
      },
    );
  }

}