import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<String> {
  DrawerCubit() : super('');

  void selectIndex(int index){
    switch (index){
      case 0:
        emit('L0');
        break;
      case 1:
        emit('L1');
        break;
      case 2:
        emit('L2');
        break;
      case 3:
        emit('L3');
        break;
      case 4:
        emit('M1');
        break;
      case 5:
        emit('M2');
        break;
        default: 'L0';
    }
  }


  void selectManagementIndex(int index){
    switch (index){
      case 0:
        emit('P0');
        break;
      case 1:
        emit('P1');
        break;
      case 2:
        emit('P2');
        break;
      case 3:
        emit('P3');
        break;
      case 4:
        emit('P4');
        break;
      case 5:
        emit('P5');
        break;
      default: 'P0';
    }
  }

}
