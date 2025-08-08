import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login({
    required String userId,
    required String password,
  });
  
  Future<Either<Failure, User>> signup({
    required String userId,
    required String password,
    required String email,
    required String phone,
  });
  
  Future<Either<Failure, void>> logout();
  
  Future<Either<Failure, bool>> isLoggedIn();
  
  Future<Either<Failure, String?>> getCurrentUserId();
}