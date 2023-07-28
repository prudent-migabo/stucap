import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stucap/data/data.dart';

class StudentsRepository {
  
  CollectionReference studentRef = FirebaseFirestore.instance.collection('students');

  Future addStudent () async{
    await studentRef.add({
      'middleName': 'Ali',
      'lastName': 'Musavuli',
      'promotion': "L0",
      'presenceStatus': true,
      'academicFees': "100",
      'inscriptionStatus': true,
    });
  }

  Future updatePresenceStatus (String uid) async{
    // try{
      await studentRef.doc(uid).update({'presenceStatus': true});
    // } catch(e){
    //   throw CustomError(message: e.toString());
    // }
  }
  
  // Registered Students
  Stream<StudentModel> studentModel (String uid){
     return studentRef.doc(uid).snapshots().map((event) => StudentModel.fromMap(event));
  }

  List<StudentModel> listStudent (QuerySnapshot? querySnapshot){
    return querySnapshot!.docs.map((e) => StudentModel.fromMap(e)).toList();
  }

  Stream<List<StudentModel>> listRegisteredStudents (String promotion){
    return studentRef.where('promotion', isEqualTo: promotion).where('inscriptionStatus', isEqualTo: true).snapshots().map(listStudent);
  }


  // Present students
  Stream<List<StudentModel>> listPresentStudents (String promotion){
     // print('11111111111111111111111111111111111111111111111111111111111111111111111111111111111${studentRef.snapshots().map(listStudent).length}');
    return studentRef.where("promotion", isEqualTo: promotion).where("presenceStatus", isEqualTo: true).snapshots().map(listStudent);
  }
  
}