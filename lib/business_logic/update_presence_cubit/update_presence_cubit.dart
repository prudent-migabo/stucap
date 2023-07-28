import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stucap/business_logic/business_logic.dart';
import 'package:stucap/data/data.dart';


class UpdatePresenceCubit extends Cubit<UpdatePresenceState> {
  UpdatePresenceCubit() : super(UpdatePresenceInitial());

  final StudentsRepository _repository = StudentsRepository();

  Future updatePresence (String uid) async {
    try{
      emit(UpdatePresenceLoading());
      await _repository.updatePresenceStatus(uid);
      emit(UpdatePresenceLoaded());
    } on CustomError catch (e){
      emit(UpdatePresenceError(message: e));
      rethrow;
    }
  }
}
