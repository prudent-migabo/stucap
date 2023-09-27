import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stucap/data/data.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentState.initial()) {
    getStudentsMonitor();
  }

  StreamSubscription? subscription;

  StreamSubscription<List<StudentModel>> getStudentsMonitor() {
    return subscription =
        StudentsRepository().listStudents().listen((event) {
      emit(state.copyWith(students: event));
    });
  }


  Future<void> updateStudent(String studentID) async {
    try {
      emit(state.copyWith(studentStatus: StudentStatus.submitting));
      await StudentsRepository().updatePresenceStatus(studentID);
      emit(state.copyWith(studentStatus: StudentStatus.submitted),);
    } catch (e) {
      emit(state.copyWith(
          studentStatus: StudentStatus.error, error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    subscription!.cancel();
    return super.close();
  }
}
