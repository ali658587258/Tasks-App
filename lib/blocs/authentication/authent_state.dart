part of 'authent_cubit.dart';

@immutable
abstract class AuthentState {}

class AuthentInitial extends AuthentState {}

class RegisterSuccess extends AuthentState {}
class RegisterLoding extends  AuthentState {}
class RegisterError extends   AuthentState {}

class LoginSuccess extends AuthentState {}
class LoginLoding extends  AuthentState {}
class LoginError extends   AuthentState {}

class LoginOutLoadingState extends AuthentState {}
class LoginOutSuccsesstState extends AuthentState {}
class LoginOutErrorState extends AuthentState {}
