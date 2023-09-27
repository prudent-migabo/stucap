part of 'drawer_cubit.dart';

enum DraweStatus {
  L0,
  L1,
  L2,
  L3,
  M1,
  M2,
}

class DrawerState extends Equatable{
  @override
  List<Object?> get props => [index, draweStatus];

  DraweStatus draweStatus;
  int index;

//<editor-fold desc="Data Methods">

  DrawerState({
    required this.draweStatus,
    required this.index,
  });


  DrawerState copyWith({
    DraweStatus? draweStatus,
    int? index,
  }) {
    return DrawerState(
      draweStatus: draweStatus ?? this.draweStatus,
      index: index ?? this.index,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'draweStatus': draweStatus,
      'index': index,
    };
  }

  factory DrawerState.initial() {
    return DrawerState(
      draweStatus: DraweStatus.L0,
      index: 0,
    );
  }

}
