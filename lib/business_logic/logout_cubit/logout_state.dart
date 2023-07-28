import 'package:stucap/data/data.dart';

abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutLoaded extends LogoutState {}

class LogoutError extends LogoutState {
  CustomError message;

  LogoutError({
    required this.message,
  });
}
