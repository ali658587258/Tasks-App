import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/screens/Authentication/register_screen.dart';


import '../../component/my_button.dart';
import '../../component/sign_button.dart';
import '../../core/utils/app_navigator.dart';
import '../../src/theme.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          children: [
            Container(
              height: 400.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: KmainColor,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(60),bottomLeft: Radius.circular(60)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome!',style: TextStyle(fontSize: 36.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text('Singn in or create a new account',style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w300,color: Colors.white),),

                ],
              ),
            ),
            SizedBox(height: 100.h,),

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: MyButton(text: 'Go to Sign in', function: (){
                AppNavigator.navigateToNewScreen(context, LoginScreen(), false);
              }),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: SignButton(text: 'No account yet? ', text1: 'sign up', function: (){
                AppNavigator.navigateToNewScreen(context, RegisterScreen(), false);
              }),
            )
          ],
        ),
      ),
    );
  }
}
