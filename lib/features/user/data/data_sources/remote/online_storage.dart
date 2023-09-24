// import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:voting_system/features/user/data/models/candidate_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CandidateModel>> getData() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('candidates').get();
      return snapshot.docs
          .map((doc) => CandidateModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deleteData(String path) async {
    await _firestore.collection('candidates').doc(path).delete();
  }

  

  // addData
  Future<void> addData(CandidateModel candidate) async {
    try {
      await _firestore.collection('candidates').add(candidate.toFirestore());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

   Future<void> registerUserWithEmailAndPassword(TextEditingController email, TextEditingController password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      // User registered successfully
    } on FirebaseAuthException catch (e) {
      // Handle registration errors
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
  }
}
