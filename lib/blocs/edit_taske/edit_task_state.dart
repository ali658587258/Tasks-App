part of 'edit_task_cubit.dart';

@immutable
abstract class EditTaskState {}

class EditTaskInitial extends EditTaskState {}

class EditTasKLoadingState extends EditTaskState {}
class EditTaskSuccsessState extends EditTaskState {}
class EditTaskErrorState extends EditTaskState {}

class ImageSuccess extends EditTaskState {}
class ImageLoding extends  EditTaskState {}
class ImageError extends   EditTaskState {}
