part of 'update_profile_cubit.dart';

@immutable
abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProflieLoadingState extends UpdateProfileState {}

class UpdateProflieSuccsessState extends UpdateProfileState {}

class UpdateProflieErrorState extends UpdateProfileState {}
