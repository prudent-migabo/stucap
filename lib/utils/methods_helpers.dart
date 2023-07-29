import 'package:stucap/business_logic/business_logic.dart';

class MethodsHelper{
  static String addPromotion(String promotion){
    switch (promotion){
      case ('L0') :
        return 'LO';
      case ('L1') :
        return 'L1';
      case ('L2') :
        return 'L2';
      case ('L3') :
        return 'L3';
      case ('M1') :
        return 'M1';
      case ('M2') :
        return 'M2';
      default:
        return '';
    }
  }
}


String sortIndex (PromotionState state){
  switch (state.index){
    case (1) :
      return 'L0';
    case (2) :
      return 'L1';
    case (3) :
      return 'L2';
    case (4) :
      return 'L3';
    case (5) :
      return 'M1';
    case (6) :
      return 'M2';
    default:
      return '';

  }
}



