part of 'details_task_cubit.dart';

@immutable
abstract class DetailsTaskState {}

class DetailsTaskInitial extends DetailsTaskState {}

class DetailsLoadingTaskState extends DetailsTaskState {}
class DetailsScussessTaskState extends DetailsTaskState {}
class DetailsErrorTaskState extends DetailsTaskState {}
