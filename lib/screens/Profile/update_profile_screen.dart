import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/update_profile/update_profile_cubit.dart';
import '../../component/my_button.dart';
import '../../component/my_text_field.dart';
import '../../core/toast/toast_config.dart';
import '../../enums/toast_state.dart';
import '../../src/theme.dart';

class UpdateProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileCubit,UpdateProfileState>(listener: (context,state){

      if(state is UpdateProflieSuccsessState){
        Navigator.pop(context);
        ToastConfig.showToast(msg: 'Success', toastStates: ToastStates.Success);
      }
      else if (state is UpdateProflieErrorState){
        ToastConfig.showToast(msg: 'Error', toastStates: ToastStates.Error);
      }
    },
        builder: (context,state){
          var cubit = UpdateProfileCubit.get(context);
          return Scaffold(
            backgroundColor: white,
            body: Column(
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
                      Text('Update Profile',style: TextStyle(fontSize: 34.sp, fontWeight: FontWeight.w600,color: Colors.white),),

                    ],
                  ),
                ),
                SizedBox(height: 80.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: MyTextField(label: 'Your Name',
                    iconData: Icons.person,
                    controller: cubit.nameController,
                    validate: (value){
                      if(value == null || value.isEmpty)
                      {
                        return 'Name Must Not Be Empty';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: MyButton(text: 'Update Profile', function: (){
                    cubit.updateProfile();
                    cubit.nameController.clear();
                  }),
                )

              ],
            ),
          );
        });
  }
}
