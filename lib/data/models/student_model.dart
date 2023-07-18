import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel{
  String middleName;
  String lastName;
  String promotion;
  bool presenceStatus;
  double academicFees;
  bool inscriptionStatus;
  String? uid;

  StudentModel({
    required this.middleName,
    required this.lastName,
    required this.promotion,
    required this.presenceStatus,
    required this.academicFees,
    required this.inscriptionStatus,
    this.uid,
  });


  Map<String, dynamic> toMap() {
    return {
      'middleName': middleName,
      'lastName': lastName,
      'promotion': promotion,
      'presenceStatus': presenceStatus,
      'academicFees': academicFees,
      'inscriptionStatus': inscriptionStatus,
      'uid': uid,
    };
  }

  factory StudentModel.fromMap(DocumentSnapshot map) {
    Map data = map.data()! as Map;
    return StudentModel(
      middleName: data['middleName'] ?? '',
      lastName: data['lastName'] ?? '',
      promotion: data['promotion'] ?? '',
      presenceStatus: data['presenceStatus'] ?? false,
      academicFees: data['academicFees'] ?? 0.0,
      inscriptionStatus: data['inscriptionStatus'] ?? false,
      uid: data['uid'] ?? '',
    );
  }

}