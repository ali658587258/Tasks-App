import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../model/chang_password.dart';
import '../../service/dio_helper/dio_helper.dart';
import '../../service/sharedPreferans/sharedPreferance.dart';
import '../../service/sharedPreferans/shared_preferans_keys.dart';


part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());
  static ChangePasswordCubit get(context) => BlocProvider.of(context);

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  ChangePassword? changePassword;

  userChangePassword(){
    emit(ChangePasswordLoadingState());
    DioHelper.postData(url: 'change-password',
        data: {
          'password':passwordController.text,
          'confirm_password':confirmPasswordController.text
        },
        token:
        SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token)
    ).then((value){
      changePassword = ChangePassword.fromJson(value.data);
      emit(ChangePasswordSuccsessState());
      print('suc');
    }).catchError((error){
      print('Error $error');
      emit(ChangePasswordErrorState());
    });
  }
}
