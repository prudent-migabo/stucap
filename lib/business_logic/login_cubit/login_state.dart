import 'package:stucap/data/data.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {}

class LoginError extends LoginState {
  CustomError message;

  LoginError({
    required this.message,
  });
}
