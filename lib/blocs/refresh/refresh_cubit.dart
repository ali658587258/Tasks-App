import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../service/dio_helper/dio_helper.dart';
import '../../service/sharedPreferans/sharedPreferance.dart';
import '../../service/sharedPreferans/shared_preferans_keys.dart';

part 'refresh_state.dart';

class RefreshCubit extends Cubit<RefreshState> {
  RefreshCubit() : super(RefreshInitial());
  static RefreshCubit get(context)=> BlocProvider.of(context);

  refresh(){
    emit(RefreshLoadingState());
    DioHelper.postData(
        url: 'refresh',
        data: {

        },
        token:
        SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token)
    ).then((value){
      emit(RefreshScussessState());
    }).catchError((error){
      emit(RefreshErrorState());
    });
  }
}
