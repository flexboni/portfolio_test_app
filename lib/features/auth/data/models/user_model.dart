import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    required String phoneNumber,
    required DateTime createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

// Extension to convert Model to Entity
extension UserModelX on UserModel {
  User toEntity() {
    return User(
      id: id,
      email: email,
      phoneNumber: phoneNumber,
      createdAt: createdAt,
    );
  }
}

// Extension to convert Entity to Model
extension UserEntityX on User {
  UserModel toModel() {
    return UserModel(
      id: id,
      email: email,
      phoneNumber: phoneNumber,
      createdAt: createdAt,
    );
  }
}