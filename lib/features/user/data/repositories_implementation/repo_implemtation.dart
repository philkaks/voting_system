import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:voting_system/features/user/data/data_sources/remote/online_storage.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/repository_interfaces/repository_interface.dart';
import '../models/candidate_model.dart';


class UserRepositoryImplementation implements UserRepositoryInterface {


  @override
  Future< List< CandidateModel>> getData() async {
    try {
      final candidates = await FirebaseService().getData();
      print('candidates .........................................');
      return candidates;
    } on Failure catch (_) {
      rethrow ;
    }


  }

  @override
  Future< void> registerUserWithEmailAndPassword(TextEditingController email, TextEditingController password) async {
    try {
      return await FirebaseService().registerUserWithEmailAndPassword(email, password);
    } on Failure catch (_) {
      rethrow ;
    }
  }


  @override
  Future< void> addPerson(CandidateModel candidate) async {
    try {
      
      return await FirebaseService().addData(candidate);
    } on Failure catch (_) {
      rethrow ;
    }
  }

  @override
  Future< void> deleteData(String id) async {
    try {
      return await FirebaseService().deleteData(id);
    } on Failure catch (_) {
      rethrow ;
    }
  }
}
