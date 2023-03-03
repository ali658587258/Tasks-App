part of 'refresh_cubit.dart';

@immutable
abstract class RefreshState {}

class RefreshInitial extends RefreshState {}

class RefreshLoadingState extends RefreshState {}
class RefreshScussessState extends RefreshState {}
class RefreshErrorState extends RefreshState {}
