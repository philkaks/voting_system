import 'package:flutter/material.dart';
import 'package:voting_system/features/user/data/models/candidate_model.dart';



abstract class UserRepositoryInterface {
    
    Future< List<CandidateModel>> getData();    
    Future< void> addPerson(CandidateModel user);
    Future< void> deleteData(String id);
    Future< void> registerUserWithEmailAndPassword(TextEditingController email, TextEditingController password);
  }
 
 
