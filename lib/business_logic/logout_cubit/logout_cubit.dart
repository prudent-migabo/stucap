import 'package:bloc/bloc.dart';
import 'package:stucap/data/data.dart';
import 'logout_state.dart';


class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  final AuthRepository _repository = AuthRepository();

  Future logout() async{
    try{
      emit(LogoutLoading());
     await _repository.logout();
      emit(LogoutLoaded());
    } on CustomError catch (e){
      emit(LogoutError(message: e));
      rethrow;
    }
  }

}
