import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  // instancia do auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // instancia do firestore
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // loga o usuario
  Future<UserCredential> signInWithEmailandPassword(
      String email, String password) async {
    try {
      // logar
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // adiciona um novo documento para o usuario em users collection se já não existir
      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      }, SetOptions(merge: true));

      return userCredential;
    }
    // captura qualquer erro que venha a ter
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

// cria um novo usuario
  Future<UserCredential> signUpWithEmailandPassword(
      String email, password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // depois de criar um usuario, cria um novo documento
      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

// desloga o usuario
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}
