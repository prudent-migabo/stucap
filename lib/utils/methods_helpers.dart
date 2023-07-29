import 'package:stucap/business_logic/business_logic.dart';

class MethodsHelper {

  static String sortStreamTitle(PromotionState state) {
    switch (state.index) {
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


  static String sortAppbarTitle1(PromotionState state) {
    switch (state.index) {
      case (1) :
        return "L0 : Présence d'aujourd'hui";
      case (2) :
        return "L1 : Présence d'aujourd'hui";
      case (3) :
        return "L2  : Présence d'aujourd'hui";
      case (4) :
        return "L3 : Présence d'aujourd'hui";
      case (5) :
        return "M1 : Présence d'aujourd'hui";
      case (6) :
        return "M2 : Présence d'aujourd'hui";
      default:
        return '';
    }
  }

  static String sortAppbarTitle2(PromotionState state) {
    switch (state.index) {
      case (1) :
        return "L0 : Etudiants inscrits";
      case (2) :
        return "L1 : Etudiants inscrits";
      case (3) :
        return "L2  : Etudiants inscrits";
      case (4) :
        return "L3 : Etudiants inscrits";
      case (5) :
        return "M1 : Etudiants inscrits";
      case (6) :
        return "M2 : Etudiants inscrits";
      default:
        return '';
    }
  }
}



