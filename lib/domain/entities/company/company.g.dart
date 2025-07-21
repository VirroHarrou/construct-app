// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Company _$CompanyFromJson(Map<String, dynamic> json) => _Company(
      id: json['id'] as String,
      name: json['name'] as String,
      inn: json['inn'] as String,
    );

Map<String, dynamic> _$CompanyToJson(_Company instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'inn': instance.inn,
    };

_CompanyCreate _$CompanyCreateFromJson(Map<String, dynamic> json) =>
    _CompanyCreate(
      name: json['name'] as String,
      inn: json['inn'] as String,
    );

Map<String, dynamic> _$CompanyCreateToJson(_CompanyCreate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'inn': instance.inn,
    };

_CompanyUpdate _$CompanyUpdateFromJson(Map<String, dynamic> json) =>
    _CompanyUpdate(
      name: json['name'] as String?,
      inn: json['inn'] as String?,
    );

Map<String, dynamic> _$CompanyUpdateToJson(_CompanyUpdate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'inn': instance.inn,
    };
