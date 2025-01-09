import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/datasources/auth_local_datasource.dart';
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/signup_usecase.dart';
import '../../features/auth/domain/usecases/logout_usecase.dart';

// Portfolio imports
import '../../features/portfolio/data/datasources/portfolio_datasource.dart';
import '../../features/portfolio/data/repositories/portfolio_repository_impl.dart';
import '../../features/portfolio/domain/repositories/portfolio_repository.dart';
import '../../features/portfolio/domain/usecases/get_assets_usecase.dart';

part 'providers.g.dart';

// Core providers
@riverpod
Future<SharedPreferences> sharedPreferences(Ref ref) async {
  return await SharedPreferences.getInstance();
}

// Data layer providers
@riverpod
Future<AuthLocalDataSource> authLocalDataSource(Ref ref) async {
  final sharedPrefs = await ref.watch(sharedPreferencesProvider.future);
  return AuthLocalDataSourceImpl(sharedPreferences: sharedPrefs);
}

@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  return AuthRemoteDataSourceImpl();
}

// Repository providers
@riverpod
Future<AuthRepository> authRepository(Ref ref) async {
  final localDataSource = await ref.watch(authLocalDataSourceProvider.future);
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(
    localDataSource: localDataSource,
    remoteDataSource: remoteDataSource,
  );
}

// UseCase providers
@riverpod
Future<LoginUseCase> loginUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return LoginUseCase(repository);
}

@riverpod
Future<SignupUseCase> signupUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return SignupUseCase(repository);
}

@riverpod
Future<LogoutUseCase> logoutUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return LogoutUseCase(repository);
}

// Portfolio providers
@riverpod
PortfolioDataSource portfolioDataSource(Ref ref) {
  return PortfolioDataSourceImpl();
}

@riverpod
PortfolioRepository portfolioRepository(Ref ref) {
  return PortfolioRepositoryImpl(
    dataSource: ref.watch(portfolioDataSourceProvider),
  );
}

@riverpod
GetAssetsUseCase getAssetsUseCase(Ref ref) {
  return GetAssetsUseCase(ref.watch(portfolioRepositoryProvider));
}