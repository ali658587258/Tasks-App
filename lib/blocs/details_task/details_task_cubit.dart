import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../model/details_task_model.dart';
import '../../service/dio_helper/dio_helper.dart';
import '../../service/sharedPreferans/sharedPreferance.dart';
import '../../service/sharedPreferans/shared_preferans_keys.dart';

part 'details_task_state.dart';

class DetailsTaskCubit extends Cubit<DetailsTaskState> {
  DetailsTaskCubit() : super(DetailsTaskInitial());
  static DetailsTaskCubit get(context)=> BlocProvider.of(context);

  DetailsTaskModel? detailsTaskModel;

  detailsTask({required int id}){
    emit(DetailsLoadingTaskState());
    DioHelper.getData(
        url: 'tasks/${id}',
        token:
        SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token)
    ).then((value){
      detailsTaskModel = DetailsTaskModel.fromJson(value.data);
      emit(DetailsScussessTaskState());
    }).catchError((error){
      emit(DetailsErrorTaskState());
      print('Error $error');
    });
  }
}
