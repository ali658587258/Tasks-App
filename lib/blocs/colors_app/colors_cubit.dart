import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'colors_state.dart';

class ColorsCubit extends Cubit<ColorsState> {
  ColorsCubit() : super(ColorsInitial());
  static ColorsCubit get(context)=> BlocProvider.of(context);
  Random random = Random();
  int? index;
  List colorsList = [
    Color(0xfff8305b),
    Color(0xfff8cd30),
    Color(0xfff86930),
    Color(0xff6930f8),
    Color(0xff30bff8),
    Color(0xff30f869),
    Color(0xffCD5C5C),
    Color(0xffFA8072)
  ];
  generateColor() {
    index = random.nextInt(colorsList.length);

  }
}
