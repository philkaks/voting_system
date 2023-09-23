import 'package:dartz/dartz.dart';
import 'package:voting_system/features/user/data/models/candidate_model.dart';
import '../../../../core/failure/failure.dart';



abstract class UserRepositoryInterface {
    
    Future< List<CandidateModel>> getData();    
    Future<Either<Failure, void>> addProduct(CandidateModel user);
    Future<Either<Failure, void>> deleteData(String id);
  }
 
 
 