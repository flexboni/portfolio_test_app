import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/providers/providers.dart';
import '../states/auth_state.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    return const AuthState.initial();
  }

  Future<void> login({
    required String userId,
    required String password,
  }) async {
    state = const AuthState.loading();

    final loginUseCase = await ref.read(loginUseCaseProvider.future);
    final result = await loginUseCase(
      userId: userId,
      password: password,
    );

    result.fold(
      (failure) => state = AuthState.error(failure),
      (user) => state = AuthState.authenticated(user),
    );
  }

  Future<void> signup({
    required String userId,
    required String password,
    required String email,
    required String phone,
  }) async {
    state = const AuthState.loading();

    final signupUseCase = await ref.read(signupUseCaseProvider.future);
    final result = await signupUseCase(
      userId: userId,
      password: password,
      email: email,
      phone: phone,
    );

    result.fold(
      (failure) => state = AuthState.error(failure),
      (user) => state = AuthState.authenticated(user),
    );
  }

  Future<void> logout() async {
    state = const AuthState.loading();

    final logoutUseCase = await ref.read(logoutUseCaseProvider.future);
    final result = await logoutUseCase();

    result.fold(
      (failure) => state = AuthState.error(failure),
      (_) => state = const AuthState.unauthenticated(),
    );
  }

  Future<void> checkAuthStatus() async {
    final repository = await ref.read(authRepositoryProvider.future);
    
    final result = await repository.isLoggedIn();
    
    result.fold(
      (failure) => state = AuthState.error(failure),
      (isLoggedIn) {
        if (isLoggedIn) {
          // In a real app, you'd fetch the current user here
          // For now, just mark as unauthenticated to force re-login
          state = const AuthState.unauthenticated();
        } else {
          state = const AuthState.unauthenticated();
        }
      },
    );
  }
}