part of 'delete_task_cubit.dart';

@immutable
abstract class DeleteTaskState {}

class DeleteTaskInitial extends DeleteTaskState {}

class DeleteTaskLoadingState extends DeleteTaskState {}
class DeleteTaskSuccsessState extends DeleteTaskState {}
class DeleteTaskErrorState extends DeleteTaskState {}
