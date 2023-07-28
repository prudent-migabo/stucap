
abstract class PromotionState {
  int? index;

  PromotionState({
    this.index,
  });
}

class PromotionStateInitial extends PromotionState {
  PromotionStateInitial(int index) : super (index: index);
}

class State1 extends PromotionState {
  String value;

  State1({
    required this.value,
  });
}

class State2 extends PromotionState {
  String value;

  State2({
    required this.value,
  });
}

class State3 extends PromotionState {
  String value;

  State3({
    required this.value,
  });
}

class State4 extends PromotionState {
  String value;

  State4({
    required this.value,
  });
}

class State5 extends PromotionState {
  String value;

  State5({
    required this.value,
  });
}

class State6 extends PromotionState {
  String value;

  State6({
    required this.value,
  });
}
