part of 'chart_cubit.dart';

@immutable
abstract class ChartState {}

class ChartInitial extends ChartState {}

class ChartLoadingState extends ChartState {}

class ChartSuccsessState extends ChartState {}

class ChartErrorState extends ChartState {}
