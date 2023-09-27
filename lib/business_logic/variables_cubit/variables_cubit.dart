import 'package:bloc/bloc.dart';
import 'package:stucap/business_logic/business_logic.dart';


class PromotionCubit extends Cubit<PromotionState> {
  PromotionCubit() : super(PromotionStateInitial(0));

  void addPromotion (int index){
    emit(PromotionStateInitial(index));
  }

  void addPromotion1 (){
    emit(State1(value: 'L0'));
  }

  void addPromotion2 (){
    emit(State1(value: 'L1'));
  }

  void addPromotion3 (){
    emit(State1(value: 'L2'));
  }

  void addPromotion4 (){
    emit(State1(value: 'L3'));
  }

  void addPromotion5 (){
    emit(State1(value: 'M1'));
  }

  void addPromotion6 (){
    emit(State1(value: 'M2'));
  }

  // void addPromotion1(String promotion){
  //   switch (promotion){
  //     case ('L0') :
  //       emit(PromotionState('L0'));
  //       break;
  //     case ('L1') :
  //       emit(PromotionState('L1'));
  //       break;
  //     case ('L2') :
  //       emit(PromotionState('L2'));
  //       break;
  //     case ('L3') :
  //       emit(PromotionState('L3'));
  //       break;
  //     case ('M1') :
  //       emit(PromotionState('M1'));
  //       break;
  //     case ('M2') :
  //       emit(PromotionState('M2'));
  //       break;
  //     default:
  //       '';
  //   }
  // }

  // void addPageTitle (String pageTitle){
  //   switch (pageTitle){
  //     case ('L0') :
  //       emit('LO');
  //       break;
  //     case ('L1') :
  //       emit('L1');
  //       break;
  //     case ('L2') :
  //       emit('L2');
  //       break;
  //     case ('L3') :
  //       emit('L3');
  //       break;
  //     case ('M1') :
  //       emit('M1');
  //       break;
  //     case ('M2') :
  //       emit('M2');
  //       break;
  //     default:
  //       '';
  //   }
  // }

}
