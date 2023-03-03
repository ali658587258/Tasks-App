import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../blocs/edit_taske/edit_task_cubit.dart';
import '../../component/custom_buttom.dart';
import '../../component/floating_button.dart';
import '../../component/input_field.dart';
import '../../component/my_button.dart';
import '../../core/toast/toast_config.dart';
import '../../core/utils/app_navigator.dart';
import '../../enums/toast_state.dart';
import '../../src/theme.dart';
import 'home_screen.dart';

class EditTaskScreen extends StatefulWidget {

  final int id;
  final String myState;
  late final String description;
  late final String title;
  late final String startDateTask;
  late final String endDateTask;


  EditTaskScreen(
      {
        required this.id,
        required this.myState,
        required this.description,
        required this.title,
        required this.startDateTask,
       required this.endDateTask
      });

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();

}

class _EditTaskScreenState extends State<EditTaskScreen> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  int? number;
  String? myState;
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<EditTaskCubit, EditTaskState>(listener: (context, state) {
      if(state is EditTaskSuccsessState){
        AppNavigator.navigateToNewScreen(context, HomeScreen(), true);
        ToastConfig.showToast(msg: 'Success', toastStates: ToastStates.Success);
      }
      else if(state is EditTaskErrorState){
        ToastConfig.showToast(msg: 'Error', toastStates: ToastStates.Error);
      }

    },
      builder: (context, state) {
        var cubit = EditTaskCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            backgroundColor: white,
            body: Padding(
              padding: const EdgeInsets.only(right: 20.0,left: 20,bottom: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Edit Task',style: TextStyle(fontSize: 24.sp),),
                    SizedBox(
                      height: 20.h,
                    ),
                    InputField(text: 'Title',
                        controller: cubit.titleController,
                        hint: widget.title),
                    InputField(text: 'Description',
                        controller: cubit.descriptionController,
                        hint: widget.description,
                    ),
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
                            hint: cubit.endDateController.text,
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
                                      cubit.endDateController.text = '$Onlydate';
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
                    SizedBox(
                      width: double.infinity,
                      height: 250.h,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade300,
                          ),
                          child: cubit.imageFile ==null?
                          Center(child: Text('There is now image')):
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
                    MyButton(text: 'Edit', function: (){
                      cubit.editTask(
                          id: widget.id,
                          title: widget.title ,
                          description: widget.description ,
                          startDate: widget.startDateTask ,
                          endDate: widget.endDateTask ,
                          myState: widget.myState);
                    }),
                    SizedBox(height: 10.h,)

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
