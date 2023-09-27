import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stucap/data/data.dart';

class StudentsRepository {
  CollectionReference studentRef =
      FirebaseFirestore.instance.collection('students');

  Future updatePresenceStatus(String uid) async {
    await studentRef.doc(uid).update({'presenceStatus': true});
  }

  // Registered Students
  Stream<StudentModel> studentModel(String uid) {
    return studentRef
        .doc(uid)
        .snapshots()
        .map((event) => StudentModel.fromMap(event));
  }

  List<StudentModel> listStudent(QuerySnapshot? querySnapshot) {
    return querySnapshot!.docs.map((e) => StudentModel.fromMap(e)).toList();
  }

  Stream<List<StudentModel>> listRegisteredStudents(String promotion) {
    return studentRef
        .where('promotion', isEqualTo: promotion)
        .where('inscriptionStatus', isEqualTo: true)
        .snapshots()
        .map(listStudent);
  }

  // Present students
  Stream<List<StudentModel>> listPresentStudents(String promotion) {
    return studentRef
        .where("promotion", isEqualTo: promotion)
        .where("presenceStatus", isEqualTo: true)
        .snapshots()
        .map(listStudent);
  }

  Stream<List<StudentModel>> listStudents() {
    return studentRef.orderBy('createdAt', descending: true).snapshots().map(
        (querySnapshot) =>
            querySnapshot.docs.map((e) => StudentModel.fromMap(e)).toList());
  }
}
