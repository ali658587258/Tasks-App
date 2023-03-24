import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../blocs/authentication/authent_cubit.dart';
import '../../component/my_button.dart';
import '../../component/my_text_field.dart';
import '../../core/toast/toast_config.dart';
import '../../core/utils/app_navigator.dart';
import '../../enums/toast_state.dart';
import '../../src/theme.dart';
import '../bottom_nav_bar.dart';

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthentCubit,AuthentState>(listener: (context,state) {
      if(state is LoginSuccess){
        ToastConfig.showToast(msg: 'Success', toastStates: ToastStates.Success);
        AppNavigator.navigateToNewScreen(context, BottomNavBar(), true);
      }
      else if(state is LoginError){
        ToastConfig.showToast(msg: 'Error', toastStates:ToastStates.Error );
      }
      },
        builder: (context,state){
      var cubit = AuthentCubit.get(context);
      return Scaffold(
      backgroundColor: white,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  height: 300.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: KmainColor,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(60),bottomLeft: Radius.circular(60)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Welcome',style: TextStyle(fontSize: 34.sp, fontWeight: FontWeight.w600,color: Colors.white),),
                      Text('back!',style: TextStyle(fontSize: 34.sp,fontWeight: FontWeight.w300,color: Colors.white),),

                    ],
                  ),
                ),
                SizedBox(height: 50.h,),

                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: MyTextField(
                      label: 'Email',
                      iconData: Icons.email,
                      controller: cubit.emailController,
                    validate: (value){
                      if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value!)){
                        return "Enter correct email";
                      }else{
                        return null;
                      }
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: MyTextField(
                    label: 'Password',
                    iconData: Icons.key,
                    controller: cubit.passwordController,
                    isPassword: true,
                    validate: (value){
                      if(value!.isEmpty){
                        return "Enter correct password";
                      }else{
                        return null;
                      }
                    }
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                if (state is LoginLoding)
                  LinearProgressIndicator(
                    backgroundColor: Colors.white,
                    color: KmainColor,
                  ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: MyButton(
                      text: 'Sign in!',
                      function: () {
                        if(formKey.currentState!.validate()){
                          cubit.login();
                          cubit.passwordController.clear();
                          cubit.emailController.clear();
                        }

                      }),
                ),
              ],
            ),
          ),
        ),
      );
    }
    );
  }
}
