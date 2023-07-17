import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stucap/data/data.dart';

import 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(Initial());

  final AuthRepository _repository = AuthRepository();

  Future login({required String email, required String password}) async{
    try{
      emit(Loading());
      _repository.login(email: email, password: password);
      emit(Loaded());
    } on CustomError{
      rethrow;
    } catch (e){
      throw CustomError(message: e.toString());
    }
  }
}
