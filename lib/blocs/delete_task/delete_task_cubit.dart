import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../service/dio_helper/dio_helper.dart';
import '../../service/sharedPreferans/sharedPreferance.dart';
import '../../service/sharedPreferans/shared_preferans_keys.dart';


part 'delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit() : super(DeleteTaskInitial());

  static DeleteTaskCubit get(context)=> BlocProvider.of(context);

  deleteTask({required int id,}) {
    emit(DeleteTaskLoadingState());
    DioHelper.deleteData(
        url: 'tasks/$id',
        token: SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token)
    ).
    then((value){
      emit(DeleteTaskSuccsessState());
    }).catchError((error){
      print('Error $error');
      emit(DeleteTaskErrorState());
    });
  }
}
