part of 'add_task_cubit.dart';

@immutable
abstract class AddTaskState {}

class TaskInitial extends  AddTaskState {}

class ImageSuccess extends AddTaskState {}
class ImageLoding extends  AddTaskState {}
class ImageError extends   AddTaskState {}

class AudioSuccess extends AddTaskState {}

class AddTaskLoadingState extends AddTaskState {}
class AddTaskSuccsessState extends  AddTaskState {}
class AddTaskErrorState extends   AddTaskState {}


