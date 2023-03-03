part of 'change_password_cubit.dart';

@immutable
abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState {}
class ChangePasswordSuccsessState extends ChangePasswordState {}
class ChangePasswordErrorState extends ChangePasswordState {}

