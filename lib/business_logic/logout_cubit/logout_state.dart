import 'package:stucap/data/data.dart';

abstract class LogoutState {}

class Initial extends LogoutState {}

class Loading extends LogoutState {}

class Loaded extends LogoutState {}

class Error extends LogoutState {
  CustomError message;

  Error({
    required this.message,
  });
}
