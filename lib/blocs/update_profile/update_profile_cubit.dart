import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../service/dio_helper/dio_helper.dart';
import '../../service/sharedPreferans/sharedPreferance.dart';
import '../../service/sharedPreferans/shared_preferans_keys.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());
  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();


  updateProfile(){
    emit(UpdateProflieLoadingState());
    DioHelper.postData(
        url: 'update-profile',
        data: {
          'name': nameController.text
        },
      token: SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token)

    )
        .then((value){
          emit(UpdateProflieSuccsessState());
    }).catchError((error){
      emit(UpdateProflieErrorState());
    });
  }
}
