import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../service/dio_helper/dio_helper.dart';
import '../../service/sharedPreferans/sharedPreferance.dart';
import '../../service/sharedPreferans/shared_preferans_keys.dart';

part 'edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit() : super(EditTaskInitial());
  static EditTaskCubit get(context)=> BlocProvider.of(context);
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startDataController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController statesController = TextEditingController();
  File? imageFile;
  final imagePicker = ImagePicker();



  imageFromGallery() async {
    emit(ImageLoding());
    var pickedImage = await imagePicker.getImage(source: ImageSource.gallery);
    if(pickedImage != null)
    {
      imageFile = File(pickedImage.path);
      emit(ImageSuccess());
    }
    else{
      emit(ImageError());
    }
  }

  imageFromCamera() async {
    emit(ImageLoding());
    var pickedImage = await imagePicker.getImage(source: ImageSource.camera);
    if(pickedImage !=null)
    {
      imageFile = File(pickedImage.path);
      emit(ImageSuccess());
    }
    else{
      emit(ImageError());
    }
  }





  editTask({
    required int id,
    required String title,
    required String description,
    required String startDate,
    required String endDate,
    required myState,
}){
    emit(EditTasKLoadingState());
    DioHelper.postData(
        url: 'tasks/$id',
        data: {
          'title': title,
          'description': description,
          'start_date': startDate,
          'end_date': endDate,
          'status': myState,
          '_method': 'PUT'
        },
        token: SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token)
    ).then((value){
      print('suc');
      emit(EditTaskSuccsessState());
    }).catchError((error){
      print('Error $error');
      emit(EditTaskErrorState());
    });
  }
}


