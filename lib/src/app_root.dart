import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../blocs/add_tasks/add_task_cubit.dart';
import '../blocs/authentication/authent_cubit.dart';
import '../blocs/change_password/change_password_cubit.dart';
import '../blocs/chart/chart_cubit.dart';
import '../blocs/colors_app/colors_cubit.dart';
import '../blocs/delete_task/delete_task_cubit.dart';
import '../blocs/details_task/details_task_cubit.dart';
import '../blocs/edit_taske/edit_task_cubit.dart';
import '../blocs/get_task/get_task_cubit.dart';
import '../blocs/refresh/refresh_cubit.dart';
import '../blocs/update_profile/update_profile_cubit.dart';
import '../screens/Authentication/welcome_screen.dart';

class AppRoot extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> AuthentCubit()),
        BlocProvider(create: (context)=> AddTaskCubit()),
        BlocProvider(create: (context)=> GetTaskCubit()..getTasks()),
        BlocProvider(create: (context)=> ChangePasswordCubit()),
        BlocProvider(create: (context)=> DeleteTaskCubit()),
        BlocProvider(create: (context)=> EditTaskCubit()),
        BlocProvider(create: (context)=> RefreshCubit()..refresh()),
        BlocProvider(create: (context)=> DetailsTaskCubit()),
        BlocProvider(create: (context)=>ChartCubit()..grtChart()),
        BlocProvider(create: (context)=>ColorsCubit()..generateColor()),
        BlocProvider(create: (context)=> UpdateProfileCubit()),

      ],
      child: ScreenUtilInit(
        builder: (context,child)
        {
          return MaterialApp(

            home: //TaskStatesScreen(),
            //HomeScreen(),
            WelcomeScreen(),
            //DetailsTaskScreen(id: 1,),
            debugShowCheckedModeBanner: false,
          );
        },

      )

    );
  }
}
