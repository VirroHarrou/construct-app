// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
      id: json['id'] as String,
      fio: json['fio'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      inn: json['inn'] as String,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      company: json['company'] == null
          ? null
          : Company.fromJson(json['company'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
      'id': instance.id,
      'fio': instance.fio,
      'phone': instance.phone,
      'address': instance.address,
      'inn': instance.inn,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'company': instance.company,
    };

_UserCreate _$UserCreateFromJson(Map<String, dynamic> json) => _UserCreate(
      fio: json['fio'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      inn: json['inn'] as String,
      imageUrl: json['image_url'] as String?,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserCreateToJson(_UserCreate instance) =>
    <String, dynamic>{
      'fio': instance.fio,
      'phone': instance.phone,
      'address': instance.address,
      'inn': instance.inn,
      'image_url': instance.imageUrl,
      'password': instance.password,
    };

_UserUpdate _$UserUpdateFromJson(Map<String, dynamic> json) => _UserUpdate(
      fio: json['fio'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      description: json['description'] as String?,
      password: json['password'] as String?,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$UserUpdateToJson(_UserUpdate instance) =>
    <String, dynamic>{
      'fio': instance.fio,
      'phone': instance.phone,
      'address': instance.address,
      'description': instance.description,
      'password': instance.password,
      'image_url': instance.imageUrl,
    };
