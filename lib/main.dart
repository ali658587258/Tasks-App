import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/service/dio_helper/dio_helper.dart';
import 'package:task_app/service/sharedPreferans/sharedPreferance.dart';
import 'package:task_app/src/app_root.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await SharedPrefrenceHelper.init();
  runApp(AppRoot());
}