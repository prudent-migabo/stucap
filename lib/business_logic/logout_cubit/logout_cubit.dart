import 'package:bloc/bloc.dart';
import 'package:stucap/data/data.dart';
import 'logout_state.dart';


class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(Initial());

  final AuthRepository _repository = AuthRepository();

  Future logout() async{
    try{
      emit(Loading());
     await _repository.logout();
      emit(Loaded());
    } on CustomError catch (e){
      emit(Error(message: e));
      rethrow;
    }
  }

}
