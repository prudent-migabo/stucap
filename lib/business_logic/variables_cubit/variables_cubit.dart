import 'package:bloc/bloc.dart';
import 'package:stucap/business_logic/business_logic.dart';


class PromotionCubit extends Cubit<String> {
  PromotionCubit() : super('');

  void addPromotion(String promotion){
    switch (promotion){
      case ('L0') :
        emit('LO');
        break;
      case ('L1') :
        emit('L1');
        break;
      case ('L2') :
        emit('L2');
        break;
      case ('L3') :
        emit('L3');
        break;
      case ('M1') :
        emit('M1');
        break;
      case ('M2') :
        emit('M2');
        break;
      default:
        '';
    }
  }

  void addPageTitle (String pageTitle){
    switch (pageTitle){
      case ('L0') :
        emit('LO');
        break;
      case ('L1') :
        emit('L1');
        break;
      case ('L2') :
        emit('L2');
        break;
      case ('L3') :
        emit('L3');
        break;
      case ('M1') :
        emit('M1');
        break;
      case ('M2') :
        emit('M2');
        break;
      default:
        '';
    }
  }

}
