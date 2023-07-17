import 'package:cloud_firestore/cloud_firestore.dart';

class AgentModel {
  String email;
  String password;

  AgentModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory AgentModel.fromMap(DocumentSnapshot map) {
    Map data = map.data()! as Map;
    return AgentModel(
      email: data['email'] ?? '',
      password: data['password'] ?? '',
    );
  }

}