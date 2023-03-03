
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import '../../service/dio_helper/dio_helper.dart';
import '../../service/sharedPreferans/sharedPreferance.dart';
import '../../service/sharedPreferans/shared_preferans_keys.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(TaskInitial());

  static AddTaskCubit get(context) => BlocProvider.of(context);
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startDataController = TextEditingController();
  TextEditingController endDateContruller = TextEditingController();
  File? imageFile;
  final imagePicker = ImagePicker();
  TimeOfDay? ReminderTime;



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

  addTask(){
    emit(AddTaskLoadingState());
    DioHelper.postData(
        url: 'tasks',
        data: {
          'title': titleController.text,
          'description': descriptionController.text,
          'start_date': startDataController.text,
          'end_date': endDateContruller.text,
          //'image': imageFile
        },
        token:
        SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token))
        .then((value){
      print('suc');
      emit(AddTaskSuccsessState());
    }).catchError((error){
      emit(AddTaskErrorState());
      print(' Error $error');
    });
  }

}
