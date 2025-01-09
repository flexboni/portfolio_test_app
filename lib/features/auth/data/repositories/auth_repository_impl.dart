import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, User>> login({
    required String userId,
    required String password,
  }) async {
    try {
      // Basic validation
      if (userId.isEmpty || password.isEmpty) {
        return const Left(Failure.validation(Strings.errorAllFieldsRequired));
      }

      if (userId.length < 7) {
        return const Left(Failure.validation(Strings.errorUserIdMinLength));
      }

      if (password.length < 6) {
        return const Left(Failure.validation(Strings.errorPasswordMinLength6));
      }

      // Check credentials against local storage
      final isValidCredentials = await localDataSource.validateCredentials(
        userId: userId,
        password: password,
      );

      if (!isValidCredentials) {
        return const Left(Failure.validation(Strings.errorInvalidCredentials));
      }

      // Get user data from local storage
      final userData = await localDataSource.getUserData(userId);
      if (userData == null) {
        return const Left(Failure.cache(Strings.errorUserNotFound));
      }

      // Set logged in state
      await localDataSource.setLoggedIn(userId);
      
      // Create user entity from stored data
      final user = User(
        id: userData['userId'] as String,
        email: userData['email'] as String,
        phoneNumber: userData['phone'] as String,
        createdAt: DateTime.parse(userData['createdAt'] as String),
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
      // Validation
      if (userId.isEmpty || password.isEmpty || email.isEmpty || phone.isEmpty) {
        return const Left(Failure.validation(Strings.errorAllFieldsRequired));
      }

      if (userId.length < 7) {
        return const Left(Failure.validation(Strings.errorUserIdMinLength));
      }

      if (password.length < 10) {
        return const Left(Failure.validation(Strings.errorPasswordMinLength10));
      }

      if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email)) {
        return const Left(Failure.validation(Strings.errorInvalidEmailFormat));
      }

      if (!RegExp(r'^010-?[0-9]{4}-?[0-9]{4}$').hasMatch(phone)) {
        return const Left(Failure.validation(Strings.errorInvalidPhoneFormat));
      }

      // Check if user already exists
      final existingUserData = await localDataSource.getUserData(userId);
      if (existingUserData != null) {
        return const Left(Failure.validation(Strings.errorUserAlreadyExists));
      }

      // Save user credentials to local storage
      await localDataSource.saveUserCredentials(
        userId: userId,
        password: password,
        email: email,
        phone: phone,
      );

      // In a real app, you would also call the remote API
      // final userModel = await remoteDataSource.signup(...);

      // Set logged in state
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