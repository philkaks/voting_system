// import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:voting_system/features/user/data/models/candidate_model.dart';



class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CandidateModel>> getData() async {
    try {
      QuerySnapshot snapshot =
          await _firestore.collection('candidates').get();
      return snapshot.docs.map((doc) => CandidateModel.fromFirestore(doc)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deleteData(String path) async {
    await _firestore.collection('candidates').doc(path).delete();
  }

  Future<void> createOrUpdate([CandidateModel? candidate]) async {
    if (candidate != null) {
      await _firestore.collection('candidates').doc().set(candidate.toFirestore());
    }
  }
}