import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, User>> login({
    required String userId,
    required String password,
  }) async {
    try {
      // Mock login logic - in real app, this would call an API
      if (userId.isEmpty || password.isEmpty) {
        return const Left(Failure.validation('User ID and password are required'));
      }

      // Simulate login validation
      if (userId.length < 7) {
        return const Left(Failure.validation('User ID must be at least 7 characters'));
      }

      if (password.length < 6) {
        return const Left(Failure.validation('Password must be at least 6 characters'));
      }

      // Mock successful login
      await localDataSource.setLoggedIn(userId);
      
      final user = User(
        id: userId,
        email: '$userId@example.com',
        phoneNumber: '010-0000-0000',
        createdAt: DateTime.now(),
      );

      return Right(user);
    } on ValidationException catch (e) {
      return Left(Failure.validation(e.message));
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signup({
    required String userId,
    required String password,
    required String email,
    required String phone,
  }) async {
    try {
      // Mock signup validation
      if (userId.isEmpty || password.isEmpty || email.isEmpty || phone.isEmpty) {
        return const Left(Failure.validation('All fields are required'));
      }

      if (userId.length < 7) {
        return const Left(Failure.validation('User ID must be at least 7 characters'));
      }

      if (password.length < 10) {
        return const Left(Failure.validation('Password must be at least 10 characters'));
      }

      if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email)) {
        return const Left(Failure.validation('Invalid email format'));
      }

      if (!RegExp(r'^010-?[0-9]{4}-?[0-9]{4}$').hasMatch(phone)) {
        return const Left(Failure.validation('Invalid phone format'));
      }

      // Mock successful signup
      await localDataSource.setLoggedIn(userId);
      
      final user = User(
        id: userId,
        email: email,
        phoneNumber: phone,
        createdAt: DateTime.now(),
      );

      return Right(user);
    } on ValidationException catch (e) {
      return Left(Failure.validation(e.message));
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await localDataSource.logout();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    try {
      final result = await localDataSource.isLoggedIn();
      return Right(result);
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String?>> getCurrentUserId() async {
    try {
      final result = await localDataSource.getCurrentUserId();
      return Right(result);
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }
}