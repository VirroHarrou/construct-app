// ignore_for_file: invalid_annotation_target

import 'package:construct/domain/entities/company/company.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class User with _$User {
  factory User({
    required String id,
    required String fio,
    required String phone,
    required String address,
    required String inn,
    String? description,
    @JsonKey(name: 'image_url') String? imageUrl,
    Company? company,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
sealed class UserCreate with _$UserCreate {
  factory UserCreate({
    required String fio,
    required String phone,
    required String address,
    required String inn,
    @JsonKey(name: 'image_url') String? imageUrl,
    required String password,
  }) = _UserCreate;

  factory UserCreate.fromJson(Map<String, dynamic> json) =>
      _$UserCreateFromJson(json);
}

@freezed
sealed class UserUpdate with _$UserUpdate {
  factory UserUpdate({
    String? fio,
    String? phone,
    String? address,
    String? description,
    String? password,
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _UserUpdate;

  factory UserUpdate.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateFromJson(json);
}
