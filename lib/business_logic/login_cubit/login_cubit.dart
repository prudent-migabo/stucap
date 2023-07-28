import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stucap/data/data.dart';

import 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final AuthRepository _repository = AuthRepository();

  Future login({required String email, required String password}) async{
    try{
      emit(LoginLoading());
      await _repository.login(email: email, password: password);
      emit(LoginLoaded());
    } on CustomError catch (e){
      emit(LoginError(message: e));
      rethrow;
    }
  }
}
