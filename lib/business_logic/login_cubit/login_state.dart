import 'package:stucap/data/data.dart';

abstract class LoginState {}

class Initial extends LoginState {}

class Loading extends LoginState {}

class Loaded extends LoginState {}

class Error extends LoginState {
  CustomError message;

  Error({
    required this.message,
  });
}
