import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/change_password/change_password_cubit.dart';
import '../../component/my_button.dart';
import '../../component/my_text_field.dart';
import '../../core/toast/toast_config.dart';
import '../../core/utils/app_navigator.dart';
import '../../enums/toast_state.dart';
import '../../src/theme.dart';
import '../Authentication/login_screen.dart';

class ChangePasswordScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit,ChangePasswordState>(listener: (context,state){

      if(state is ChangePasswordSuccsessState){
        AppNavigator.navigateToNewScreen(context, LoginScreen(), true);
        ToastConfig.showToast(msg: 'Success', toastStates: ToastStates.Success);
      }
      else if (state is ChangePasswordErrorState){
        ToastConfig.showToast(msg: 'Error', toastStates: ToastStates.Error);
      }
    },
        builder: (context,state){
      var cubit = ChangePasswordCubit.get(context);
      return Scaffold(
        backgroundColor: white,
        body: Form(
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
                    Text('Change Password',style: TextStyle(fontSize: 34.sp, fontWeight: FontWeight.w600,color: Colors.white),),

                  ],
                ),
              ),
              SizedBox(height: 50.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: MyTextField(label: 'New Password',
                  iconData: Icons.key,
                  controller: cubit.passwordController,
                  isPassword: true,
                  validate: (value){
                    if(value!.isEmpty || !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value!)){
                      return "Enter correct password";
                    }else{
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 30.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: MyTextField(
                  label: 'Confirm Password',
                  iconData: Icons.key,
                  controller: cubit.confirmPasswordController,
                  isPassword: true,
                  validate: (value){
                    if(value!.isEmpty || !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value!)){
                      return "Enter correct password";
                    }else{
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: MyButton(text: 'Changr Password', function: (){
                  if(formKey.currentState!.validate()){ cubit.userChangePassword();
                  cubit.confirmPasswordController.clear();
                  cubit.passwordController.clear();
                  }
                }),
              )

            ],
          ),
        ),
      );
        });
  }
}
