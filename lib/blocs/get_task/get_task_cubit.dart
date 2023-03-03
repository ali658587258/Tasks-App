import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../model/responds_get_tasks.dart';
import '../../service/dio_helper/dio_helper.dart';
import '../../service/sharedPreferans/sharedPreferance.dart';
import '../../service/sharedPreferans/shared_preferans_keys.dart';

part 'get_task_state.dart';

class GetTaskCubit extends Cubit<GetTaskState> {
  GetTaskCubit() : super(GetTaskInitial());


  static GetTaskCubit get(context) => BlocProvider.of(context);

  double newCoutner = 0;
  double completedCoutner = 0;
  double inProgressCoutner = 0;
  double outOfDateCoutner = 0;
  double test = 1;

  RespondsGetTasks? respondsGetTasks;
  getTasks(){
    emit(GetAllLoadingState());
    DioHelper.getData(
      url: 'tasks',
      token:
        SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token))
        .then((value){
          respondsGetTasks = RespondsGetTasks.fromJson(value.data);
          newCoutner = 0;
          completedCoutner = 0;
          inProgressCoutner = 0;
          for (int i = 0; i <= respondsGetTasks!.response!.length - 1; i++) {
            if (respondsGetTasks!.response![i].status == "new") {
              newCoutner += 1;
              test = newCoutner;
            } else if (respondsGetTasks!.response![i].status == "completed") {
              completedCoutner += 1;
            } else if (respondsGetTasks!.response![i].status == "in progrecs") {
              inProgressCoutner += 1;
            }
          }

          print('suc');
          emit(GetAllSuccsessState());
    }).catchError((error){
      print(error);
      emit(GetAllErrorState());
    });
  }



}
