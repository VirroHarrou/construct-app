// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      status: json['status'] as String?,
      price: (json['price'] as num).toDouble(),
      address: json['address'] as String,
      beginTime: DateTime.parse(json['begin_time'] as String),
      endTime: DateTime.parse(json['end_time'] as String),
      userId: json['user_id'] as String,
      viewed: (json['viewed'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'status': instance.status,
      'price': instance.price,
      'address': instance.address,
      'begin_time': instance.beginTime.toIso8601String(),
      'end_time': instance.endTime.toIso8601String(),
      'user_id': instance.userId,
      'viewed': instance.viewed,
    };

_OrderCreate _$OrderCreateFromJson(Map<String, dynamic> json) => _OrderCreate(
      title: json['title'] as String,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      price: (json['price'] as num).toDouble(),
      address: json['address'] as String,
      beginTime: DateTime.parse(json['begin_time'] as String),
      endTime: DateTime.parse(json['end_time'] as String),
    );

Map<String, dynamic> _$OrderCreateToJson(_OrderCreate instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'price': instance.price,
      'address': instance.address,
      'begin_time': instance.beginTime.toIso8601String(),
      'end_time': instance.endTime.toIso8601String(),
    };

_OrderUpdate _$OrderUpdateFromJson(Map<String, dynamic> json) => _OrderUpdate(
      title: json['title'] as String?,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      address: json['address'] as String?,
      beginTime: json['begin_time'] == null
          ? null
          : DateTime.parse(json['begin_time'] as String),
      endTime: json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
    );

Map<String, dynamic> _$OrderUpdateToJson(_OrderUpdate instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'price': instance.price,
      'address': instance.address,
      'begin_time': instance.beginTime?.toIso8601String(),
      'end_time': instance.endTime?.toIso8601String(),
    };
