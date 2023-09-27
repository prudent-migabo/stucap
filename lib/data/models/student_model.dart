
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel{
  String? avatar;
  String? firstName;
  String? middleName;
  String? lastName;
  String? promotion;
  bool? presenceStatus;
  double? academicFees;
  bool? inscriptionStatus;
  int? createdAt;
  String? studentID;
  String? sex;
  String? birthDay;
  String? devise;
  String? address;
//<editor-fold desc="Data Methods">
  StudentModel({
    this.avatar,
    this.firstName,
    this.middleName,
    this.lastName,
    this.promotion,
    this.presenceStatus,
    this.academicFees,
    this.inscriptionStatus,
    this.createdAt,
    this.studentID,
    this.sex,
    this.birthDay,
    this.devise,
    this.address,
  });


  Map<String, dynamic> toMap() {
    return {
      'avatar': avatar,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'promotion': promotion,
      'presenceStatus': presenceStatus,
      'academicFees': academicFees,
      'inscriptionStatus': inscriptionStatus,
      'birthDay': birthDay,
      'sex': sex,
      'devise': devise,
      'address': address,
      'createdAt': DateTime.now().millisecondsSinceEpoch,
    };
  }

  factory StudentModel.fromMap(DocumentSnapshot doc) {
    Map map = doc.data()! as Map;
    return StudentModel(
      avatar: map['avatar'] ?? '',
      firstName: map['firstName'] ?? '',
      middleName: map['middleName'] ?? '',
      lastName: map['lastName'] ?? '',
      promotion: map['promotion'] ?? '',
      presenceStatus: map['presenceStatus'] ?? false,
      academicFees: map['academicFees'] + 0.0 ?? 0.0,
      inscriptionStatus: map['inscriptionStatus'] ?? false,
      createdAt: map['createdAt'] ?? 0,
      sex: map['sex'] ?? '',
      birthDay: map['birthDay'] ?? '',
      devise: map['devise'] ?? '',
      address: map['address'] ?? '',
      studentID: doc.id,
    );
  }

}