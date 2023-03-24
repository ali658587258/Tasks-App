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
import '../Tasks/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthentCubit,AuthentState>(listener: (context,state) {
      if(state is RegisterSuccess){
        ToastConfig.showToast(msg: 'Success', toastStates: ToastStates.Success);
        AppNavigator.navigateToNewScreen(context, HomeScreen(), true);
      }
      else if(state is RegisterError){
        ToastConfig.showToast(msg: 'Error', toastStates: ToastStates.Error);
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
                          Text('Create new',style: TextStyle(fontSize: 34.sp, fontWeight: FontWeight.w600,color: Colors.white),),
                          Text('account!',style: TextStyle(fontSize: 34.sp,fontWeight: FontWeight.w300,color: Colors.white),),

                        ],
                      ),
                    ),
                    SizedBox(height: 50.h,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: MyTextField(
                        label: 'Name',
                        iconData: Icons.person_rounded,
                        controller: cubit.nameController,
                        validate: (value){
                          if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                            return "Enter correct name";
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
                    SizedBox(height: 30.h,),
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
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    if(state is RegisterLoding)
                      LinearProgressIndicator(
                        color: white,
                        backgroundColor: KmainColor,
                      ),
                    SizedBox(
                      height: 5.h,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: MyButton(text: 'Sign up!', function: (){
                        if(formKey.currentState!.validate()){
                          cubit.register();
                          cubit.emailController.clear();
                          cubit.nameController.clear();
                          cubit.passwordController.clear();
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
