// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ValidationErrorDetail _$ValidationErrorDetailFromJson(
        Map<String, dynamic> json) =>
    _ValidationErrorDetail(
      loc: (json['loc'] as List<dynamic>).map((e) => e as String).toList(),
      msg: json['msg'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$ValidationErrorDetailToJson(
        _ValidationErrorDetail instance) =>
    <String, dynamic>{
      'loc': instance.loc,
      'msg': instance.msg,
      'type': instance.type,
    };
