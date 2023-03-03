
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../blocs/colors_app/colors_cubit.dart';
import '../../blocs/get_task/get_task_cubit.dart';
import '../../component/custom_buttom.dart';
import '../../component/task_card.dart';
import '../../src/theme.dart';

class TaskStatesScreen extends StatefulWidget {
  String statu='all';

  @override
  State<TaskStatesScreen> createState() => _TaskStatesScreenState();
}

class _TaskStatesScreenState extends State<TaskStatesScreen> {
  int? number;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetTaskCubit,GetTaskState>(listener: (context,state){

    },
      builder: (context,state){
      var cubit = GetTaskCubit.get(context);
      var cubitColor = ColorsCubit.get(context);
      return Scaffold(
        backgroundColor: white,
        body:
        cubit.respondsGetTasks == null ?
        Center(child: CircularProgressIndicator(
          color: KmainColor,
        ),):
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomButton(
                    active:widget.statu=='all'? true:false,
                    buttonName: 'all',
                    function: () {
                      widget.statu='all';
                      setState(() {

                      });

                    },
                    width: 60,
                  ),
                    CustomButton(
                        active: widget.statu=='new'? true:false,
                        buttonName: 'New', function: () {
                      widget.statu='new';
                      setState(() {

                      });

                    }),
                    CustomButton(
                      active: widget.statu=='in_progress'? true:false,
                      buttonName: 'in progrecs',
                      function: () {
                        widget.statu='in progrecs';
                        setState(() {

                        });

                      },
                      width: 120,
                    ),
                    CustomButton(
                      active: widget.statu=='completed'? true: false,
                      buttonName: 'Completed',
                      function: () {
                        widget. statu='completed';
                        setState(() {

                        });

                      },
                      width: 120,
                    ),
                    CustomButton(
                      active: widget.statu=='out of deted'? true: false,
                      buttonName: 'Out of deted',
                      function: () {
                        widget. statu='out of deted';
                        setState(() {

                        });
                      },
                      width: 132,
                    ),
                    SizedBox(height: 50.h,),
                  ],
                ),
              ),
              cubit.respondsGetTasks!.response!.length == 0 ?
                  Container() :
              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cubit.respondsGetTasks!.response!.length,
                    itemBuilder: (context,index){
                      return
                      widget.statu==cubit.respondsGetTasks!.response![index].status||widget.statu=='all'?
                        TaskCard(
                          title: cubit.respondsGetTasks!.response![index].title!,
                          description: cubit.respondsGetTasks!.response![index].description!,
                          startDate: cubit.respondsGetTasks!.response![index].startDate!,
                          endDate: cubit.respondsGetTasks!.response![index].endDate!,
                          states: cubit.respondsGetTasks!.response![index].status!,
                        color: cubitColor.colorsList[cubitColor.index!],
                          posation: 'state',): Container();

                    },
                  separatorBuilder: ( context,  index) {
                            return SizedBox(
                              height: 10.h,
                            );
                          },
                        ),
              )

            ],
          ),
        ),);
    },);
  }
}
