import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/screens/Profile/update_profile_screen.dart';

import '../../blocs/authentication/authent_cubit.dart';
import '../../component/container_card_profile.dart';
import '../../core/utils/app_navigator.dart';
import '../../src/theme.dart';
import '../Authentication/login_screen.dart';
import 'change_password_screen.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<AuthentCubit,AuthentState>(listener: (context,state){
        if(state is LoginOutSuccsesstState){
          AppNavigator.navigateToNewScreen(context, LoginScreen(), true);
        }
      },
        builder: (context,state){
          var cubit = AuthentCubit.get(context);
          return Scaffold(
            backgroundColor: white,
            body: Center(
              child: SingleChildScrollView(
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
                          SizedBox(height: 50.h,),
                          CircleAvatar(
                            backgroundImage: NetworkImage('https://img.freepik.com/free-photo/portrait-young-beautiful-woman-gesticulating_273609-40419.jpg'),
                            radius: 50,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(cubit.authentication!.user!.name!,style: TextStyle(fontSize: 28,fontWeight: FontWeight.w900,color: Colors.white,)),
                          SizedBox(
                            height: 8,
                          ),
                          Text(cubit.authentication!.user!.email!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white)),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    ElevatedButton(
                      onPressed: (){
                        AppNavigator.navigateToNewScreen(context, UpdateProfileScreen(), false);
                      },
                      child: Text('Upgrade to PRO'),
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(KmainColor.withOpacity(1)),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(18.0)
                            ),
                          )
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ContainerCardProfile(iconData: Icons.key ,
                        name: 'Change Password',
                        iconData1: Icons.arrow_forward_ios,
                        function: (){
                          AppNavigator.navigateToNewScreen(context, ChangePasswordScreen(), false);
                        }
                    ) ,
                    ContainerCardProfile(iconData: Icons.logout ,
                        name: 'Logout',
                        iconData1: Icons.ac_unit,
                        function: (){
                          cubit.loginOut();
                        }
                    )
                  ],

                ),
              ),
            ),
          );
        },
      );
  }
}
