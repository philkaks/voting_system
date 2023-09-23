import 'package:dartz/dartz.dart';
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
  Future<Either<Failure, void>> addProduct(CandidateModel user) async {
    try {
      return Right(await FirebaseService().createOrUpdate());
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> deleteData(String id) async {
    try {
      // await userDataSource.deleteData(id);
      return Right(await FirebaseService().deleteData(id));
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
