import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entity/auth_result_entity.dart';
import 'package:ecommerce/domain/failures.dart';

abstract class AuthRepositoryContract {
  Future<Either<Failures, AuthResultEntity>> register(String name, String email,
      String password, String rePassword, String phone);
  Future<Either<Failures, AuthResultEntity>> login(
      String email, String password);
}