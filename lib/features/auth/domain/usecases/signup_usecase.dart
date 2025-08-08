import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase(this.repository);

  Future<Either<Failure, User>> call({
    required String userId,
    required String password,
    required String email,
    required String phone,
  }) async {
    return await repository.signup(
      userId: userId,
      password: password,
      email: email,
      phone: phone,
    );
  }
}