part of 'student_cubit.dart';

enum StudentStatus {
  initial,
  submitting,
  submitted,
  error,
}

class StudentState extends Equatable{
  @override
  List<Object?> get props => [studentStatus, error, students, studentID];

  StudentStatus studentStatus;
  String error;
  List<StudentModel> students;
  String studentID;

//<editor-fold desc="Data Methods">
  StudentState({
    required this.studentStatus,
    required this.error,
    required this.students,
    required this.studentID,
  });


  StudentState copyWith({
    StudentStatus? studentStatus,
    String? error,
    List<StudentModel>? students,
    String? studentID,
  }) {
    return StudentState(
      studentStatus: studentStatus ?? this.studentStatus,
      error: error ?? this.error,
      students: students ?? this.students,
      studentID: studentID ?? this.studentID,
    );
  }

  factory StudentState.initial() {
    return StudentState(
      studentStatus: StudentStatus.initial,
      error: '',
      students: const [],
      studentID: '',
    );

  }

//</editor-fold>
}

