import '../../../../core/error/exceptions.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({
    required String userId,
    required String password,
  });
  
  Future<UserModel> signup({
    required String userId,
    required String password,
    required String email,
    required String phone,
  });
  
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // TODO: 실제 앱에서는 Dio나 http 패키지를 사용하여 API 호출
  // 현재는 Mock 구현으로 로컬 검증만 수행
  
  @override
  Future<UserModel> login({
    required String userId,
    required String password,
  }) async {
    try {
      // TODO: 실제 API 호출로 교체 필요
      // final response = await dio.post('/auth/login', data: {...});
      
      // Mock API response simulation
      await Future.delayed(const Duration(milliseconds: 500));
      
      // 서버에서 검증된 사용자 정보 반환 (현재는 Mock)
      return UserModel(
        id: userId,
        email: '$userId@example.com',
        phoneNumber: '010-0000-0000',
        createdAt: DateTime.now(),
      );
    } catch (e) {
      throw ServerException('Login failed: $e');
    }
  }

  @override
  Future<UserModel> signup({
    required String userId,
    required String password,
    required String email,
    required String phone,
  }) async {
    try {
      // TODO: 실제 API 호출로 교체 필요
      // final response = await dio.post('/auth/signup', data: {...});
      
      // Mock API response simulation
      await Future.delayed(const Duration(milliseconds: 800));
      
      // 서버에서 생성된 사용자 정보 반환 (현재는 Mock)
      return UserModel(
        id: userId,
        email: email,
        phoneNumber: phone,
        createdAt: DateTime.now(),
      );
    } catch (e) {
      throw ServerException('Signup failed: $e');
    }
  }

  @override
  Future<void> logout() async {
    try {
      // TODO: 실제 API 호출로 교체 필요
      // await dio.post('/auth/logout');
      
      // Mock API response simulation
      await Future.delayed(const Duration(milliseconds: 300));
    } catch (e) {
      throw ServerException('Logout failed: $e');
    }
  }
}