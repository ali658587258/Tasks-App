import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../model/responds_get_tasks.dart';
import '../../service/dio_helper/dio_helper.dart';
import '../../service/sharedPreferans/sharedPreferance.dart';
import '../../service/sharedPreferans/shared_preferans_keys.dart';


part 'chart_state.dart';

class ChartCubit extends Cubit<ChartState> {
  ChartCubit() : super(ChartInitial());
  static ChartCubit get(context) => BlocProvider.of(context);
  double newCoutner = 0;
  double completedCoutner = 0;
  double inProgressCoutner = 0;
  double outOfDateCoutner = 0;
  double test = 1;
  String? name;
  grtChart(){
    emit(ChartLoadingState());
    DioHelper.getData(
      url: 'tasks',
      token: SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token),
    ).then((value){
      var respondsGetTasks = RespondsGetTasks.fromJson(value.data);
      for(int i = 0; i <= respondsGetTasks.response!.length - 1; i++){
        if(respondsGetTasks.response![i].status=="new"){
          newCoutner += 1 ;
          test = newCoutner;
        }
        else if(respondsGetTasks.response![i].status=="completed"){
          completedCoutner+=1;
        }
        else if(respondsGetTasks.response![i].status=="in_progress"){
          inProgressCoutner +=1;
        }
        else if(respondsGetTasks.response![i].status=="outOfDate"){
          outOfDateCoutner +=1;
        }
      }
      emit(ChartSuccsessState());

    }).catchError((error){
      emit(ChartErrorState());
    });
  }
}
