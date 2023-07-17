import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stucap/data/data.dart';

class AuthRepository{
  FirebaseAuth? auth = FirebaseAuth.instance;
  FirebaseFirestore? ref = FirebaseFirestore.instance;

  ///Login user to firebase
  Future login({required String email, required String password}) async {
    try {
      var response = await auth!.signInWithEmailAndPassword(
          email: email, password: password);
      return response;
    } on FirebaseAuthException catch(e){
      // throw CustomError(message: e.message.toString());
      print("00000000000000000000000000000000000000000000000000000000000000000 ${e.message.toString()}");
    }
    catch(e){
      throw CustomError(message: e.toString());
    }
  }

  Future logout() async {
    try {
      var response = await auth!.signOut();
      return response;
    } on FirebaseAuthException catch(e){
      throw CustomError(message: e.message.toString());
    }
    catch(e){
      throw CustomError(message: e.toString());
    }
  }

}