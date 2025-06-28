// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Review _$ReviewFromJson(Map<String, dynamic> json) => _Review(
      id: json['id'] as String,
      text: json['text'] as String,
      rating: (json['rating'] as num).toInt(),
      orderId: json['orderId'] as String,
      userId: json['userId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      order: json['order'] == null
          ? null
          : Order.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewToJson(_Review instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'rating': instance.rating,
      'orderId': instance.orderId,
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
      'order': instance.order,
    };

_ReviewCreate _$ReviewCreateFromJson(Map<String, dynamic> json) =>
    _ReviewCreate(
      text: json['text'] as String,
      rating: (json['rating'] as num).toInt(),
      orderId: json['orderId'] as String,
    );

Map<String, dynamic> _$ReviewCreateToJson(_ReviewCreate instance) =>
    <String, dynamic>{
      'text': instance.text,
      'rating': instance.rating,
      'orderId': instance.orderId,
    };
