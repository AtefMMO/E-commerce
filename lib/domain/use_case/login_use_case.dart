


import 'package:dartz/dartz.dart';
import '../failures.dart';
import '../entity/auth_result_entity.dart';
import '../repository/repository/auth_repository_contract.dart';
class LoginUseCase {
  AuthRepositoryContract repositoryContract;

  LoginUseCase({required this.repositoryContract});

  Future<Either<Failures, AuthResultEntity>> invoke(
      String email, String password) {
    return repositoryContract.login(email, password);
  }
}