// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Review _$ReviewFromJson(Map<String, dynamic> json) => _Review(
      id: json['id'] as String,
      content: json['content'] as String,
      rating: (json['rating'] as num).toInt(),
      recepientId: json['recepient_id'] as String,
      senderId: json['sender_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      order: json['order'] == null
          ? null
          : Order.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewToJson(_Review instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'rating': instance.rating,
      'recepient_id': instance.recepientId,
      'sender_id': instance.senderId,
      'created_at': instance.createdAt.toIso8601String(),
      'order': instance.order,
    };

_ReviewCreate _$ReviewCreateFromJson(Map<String, dynamic> json) =>
    _ReviewCreate(
      content: json['content'] as String,
      rating: (json['rating'] as num).toInt(),
      recepientId: json['recepient_id'] as String,
    );

Map<String, dynamic> _$ReviewCreateToJson(_ReviewCreate instance) =>
    <String, dynamic>{
      'content': instance.content,
      'rating': instance.rating,
      'recepient_id': instance.recepientId,
    };
