import 'package:action_slider/action_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/colors_app/colors_cubit.dart';
import '../../blocs/delete_task/delete_task_cubit.dart';
import '../../blocs/details_task/details_task_cubit.dart';
import '../../blocs/edit_taske/edit_task_cubit.dart';
import '../../component/custom_buttom.dart';
import '../../component/custom_text.dart';
import '../../core/toast/toast_config.dart';
import '../../core/utils/app_navigator.dart';
import '../../enums/toast_state.dart';
import '../../src/theme.dart';
import 'edit_task_screen.dart';


class DetailsTaskScreen extends StatefulWidget {
  final int id;
  DetailsTaskScreen({required this.id});

  @override
  State<DetailsTaskScreen> createState() => _DetailsTaskScreenState();
}

class _DetailsTaskScreenState extends State<DetailsTaskScreen> {

  void initState() {
    DetailsTaskCubit.get(context).detailsTask(id: widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsTaskCubit,DetailsTaskState>(
        listener: (context,state){

        },
      builder: (context,state){
          var cubitColors = ColorsCubit.get(context);
          var cubit = DetailsTaskCubit.get(context);
          var cubitEdit = EditTaskCubit.get(context);
          return Scaffold(
            backgroundColor: cubitColors.colorsList[cubitColors.index!],
            body: cubit.detailsTaskModel == null ?
            Center(child: CircularProgressIndicator(
              color: bluishClr,
            ),):
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){
                          AppNavigator.navigateToNewScreen(context, EditTaskScreen(
                              id: cubit.detailsTaskModel!.response!.id!,
                              myState: cubit.detailsTaskModel!.response!.status!,
                              description: cubit.detailsTaskModel!.response!.description!,
                              title: cubit.detailsTaskModel!.response!.title!,
                              startDateTask: cubit.detailsTaskModel!.response!.startDate!,
                              endDateTask: cubit.detailsTaskModel!.response!.endDate!),
                              false);
                        }, icon: Icon(Icons.edit)),
                        BlocConsumer<DeleteTaskCubit,DeleteTaskState>(builder: (context,state){
                          var cubitDelete = DeleteTaskCubit.get(context);
                          return IconButton(onPressed: (){
                            cubitDelete.deleteTask(id: cubit.detailsTaskModel!.response!.id!);

                          }, icon: Icon(Icons.delete));
                        }, listener: (context,state){
                          if(state is DeleteTaskSuccsessState){
                            Navigator.pop(context);
                          }
                        })

                      ],
                    ),
                    SizedBox(height: 20.h,),
                    CustomText(
                      text: cubit.detailsTaskModel!.response?.title ?? 'Null',
                      fontWeight: FontWeight.bold,
                      fontSize: 36.sp,
                      color: Colors.white,
                    ),
                    SizedBox(height: 30.h,),
                    Container(
                      width: 120.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black87
                      ),
                      child: Center(child: Text(cubit.detailsTaskModel!.response?.status ?? 'Null',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomText(
                      text: cubit.detailsTaskModel!.response?.description ?? 'Null',
                      fontSize: 52.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: 'Start Date',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w300,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        CustomText(
                            text: cubit.detailsTaskModel!.response?.startDate ??
                                'Null'),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: 'End Date',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w300,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        CustomText(
                            text:
                            cubit.detailsTaskModel!.response?.endDate ?? 'Null'),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    BlocConsumer<EditTaskCubit, EditTaskState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        var editCubit = EditTaskCubit.get(context);
                        return ActionSlider.standard(
                          action: (controller) {
                            cubitEdit.editTask(
                                id: widget.id,
                                myState: 'completed',
                                description:
                                cubit.detailsTaskModel!.response!.description ??
                                    '',
                                endDate:
                                cubit.detailsTaskModel!.response!.endDate ?? '',
                                startDate:
                                cubit.detailsTaskModel!.response!.startDate ?? '',
                                title: cubit.detailsTaskModel!.response!.title ?? '');
                            ToastConfig.showToast(
                                msg: 'Done', toastStates: ToastStates.Success);
                          },
                          child: CustomText(
                            text: 'Set as Complete !',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          toggleColor: cubitColors.colorsList[cubitColors.index!],
                          backgroundColor: Colors.black87,
                          icon: Icon(Icons.done),
                          height: 60.h,
                        );
                      },
                    )
                  ],
                ),
              ),
            ) ,
          );

  },);
  }
}
