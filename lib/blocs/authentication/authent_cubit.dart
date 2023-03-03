import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


import '../../model/user_authentication.dart';
import '../../service/dio_helper/dio_helper.dart';
import '../../service/sharedPreferans/sharedPreferance.dart';
import '../../service/sharedPreferans/shared_preferans_keys.dart';

part 'authent_state.dart';

class AuthentCubit extends Cubit<AuthentState> {
  AuthentCubit() : super(AuthentInitial());
  static AuthentCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Authentication? authentication;


  register(){
    emit(RegisterLoding());
    DioHelper.postData(url: 'register', data: {
      'name':nameController.text,
      'email':emailController.text,
      'password':passwordController.text
    }).then((value){
      authentication = Authentication.fromJson(value.data);
      print(authentication!.authorisation!.token);
      emit(RegisterSuccess());
    }).catchError((error){
      emit(RegisterError());
    });
  }
  login(){
    emit(LoginLoding());
    DioHelper.postData(url: 'login', data: {
      'email': emailController.text,
      'password':passwordController.text
    }).then((value){
      authentication = Authentication.fromJson(value.data);
      SharedPrefrenceHelper.saveData( key: SharedPreferencesKeys.token, value:authentication!.authorisation!.token );
      print(SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token));
      emit(LoginSuccess());
    }).catchError((error){
      emit(LoginError());
    });
  }

  loginOut(){
    emit(LoginOutLoadingState());
    DioHelper.postData(url: 'logout', data: {
      
    },
      token: SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token)
    ).then((value){
      emit(LoginOutSuccsesstState());
    }).catchError((error){
      print('Error $error');
      emit(LoginOutErrorState());
    });
  }

}
