import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stucap/business_logic/business_logic.dart';
import 'package:stucap/data/data.dart';


class UpdatePresenceCubit extends Cubit<UpdatePresenceState> {
  UpdatePresenceCubit() : super(UpdatePresenceInitial());

  final StudentsRepository _repository = StudentsRepository();

  Future updatePresence (String studentID) async {
    try{
      emit(UpdatePresenceLoading());
      await _repository.updatePresenceStatus(studentID);
      emit(UpdatePresenceLoaded());
    } catch (e){
      emit(UpdatePresenceError(message: e.toString()));
      rethrow;
    }
  }
}
