part of 'get_task_cubit.dart';

@immutable
abstract class GetTaskState {}

class GetTaskInitial extends GetTaskState {}

class GetAllSuccsessState extends GetTaskState {}
class GetAllErrorState extends GetTaskState {}
class GetAllLoadingState extends GetTaskState {}



