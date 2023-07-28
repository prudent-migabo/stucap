
import 'package:stucap/data/data.dart';

abstract class UpdatePresenceState {}

class UpdatePresenceInitial extends UpdatePresenceState {}

class UpdatePresenceLoading extends UpdatePresenceState {}

class UpdatePresenceLoaded extends UpdatePresenceState {}

class UpdatePresenceError extends UpdatePresenceState {
  CustomError message;

  UpdatePresenceError({
    required this.message,
  });
}
