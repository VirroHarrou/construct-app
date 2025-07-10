// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Order {
  String get id;
  String get title;
  String? get description;
  String? get imageUrl;
  String? get status;
  double get price;
  String get address;
  @JsonKey(name: 'begin_time')
  DateTime get beginTime;
  @JsonKey(name: 'end_time')
  DateTime get endTime;
  @JsonKey(name: 'user_id')
  String get userId;
  @JsonKey(name: 'views_count')
  int get viewed;
  @JsonKey(name: 'waiting_user_ids')
  List<String> get waitingUserIds;

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Order &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.beginTime, beginTime) ||
                other.beginTime == beginTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.viewed, viewed) || other.viewed == viewed) &&
            const DeepCollectionEquality()
                .equals(other.waitingUserIds, waitingUserIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      imageUrl,
      status,
      price,
      address,
      beginTime,
      endTime,
      userId,
      viewed,
      const DeepCollectionEquality().hash(waitingUserIds));

  @override
  String toString() {
    return 'Order(id: $id, title: $title, description: $description, imageUrl: $imageUrl, status: $status, price: $price, address: $address, beginTime: $beginTime, endTime: $endTime, userId: $userId, viewed: $viewed, waitingUserIds: $waitingUserIds)';
  }
}

/// @nodoc
@JsonSerializable()
class _Order implements Order {
  _Order(
      {required this.id,
      required this.title,
      this.description,
      this.imageUrl,
      this.status,
      required this.price,
      required this.address,
      @JsonKey(name: 'begin_time') required this.beginTime,
      @JsonKey(name: 'end_time') required this.endTime,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'views_count') this.viewed = 0,
      @JsonKey(name: 'waiting_user_ids')
      final List<String> waitingUserIds = const <String>[]})
      : _waitingUserIds = waitingUserIds;
  factory _Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String? imageUrl;
  @override
  final String? status;
  @override
  final double price;
  @override
  final String address;
  @override
  @JsonKey(name: 'begin_time')
  final DateTime beginTime;
  @override
  @JsonKey(name: 'end_time')
  final DateTime endTime;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'views_count')
  final int viewed;
  final List<String> _waitingUserIds;
  @override
  @JsonKey(name: 'waiting_user_ids')
  List<String> get waitingUserIds {
    if (_waitingUserIds is EqualUnmodifiableListView) return _waitingUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_waitingUserIds);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$OrderToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Order &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.beginTime, beginTime) ||
                other.beginTime == beginTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.viewed, viewed) || other.viewed == viewed) &&
            const DeepCollectionEquality()
                .equals(other._waitingUserIds, _waitingUserIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      imageUrl,
      status,
      price,
      address,
      beginTime,
      endTime,
      userId,
      viewed,
      const DeepCollectionEquality().hash(_waitingUserIds));

  @override
  String toString() {
    return 'Order(id: $id, title: $title, description: $description, imageUrl: $imageUrl, status: $status, price: $price, address: $address, beginTime: $beginTime, endTime: $endTime, userId: $userId, viewed: $viewed, waitingUserIds: $waitingUserIds)';
  }
}

/// @nodoc
mixin _$OrderCreate {
  String get title;
  String? get description;
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  double get price;
  String get address;
  @JsonKey(name: 'begin_time')
  DateTime get beginTime;
  @JsonKey(name: 'end_time')
  DateTime get endTime;

  /// Serializes this OrderCreate to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderCreate &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.beginTime, beginTime) ||
                other.beginTime == beginTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, imageUrl,
      price, address, beginTime, endTime);

  @override
  String toString() {
    return 'OrderCreate(title: $title, description: $description, imageUrl: $imageUrl, price: $price, address: $address, beginTime: $beginTime, endTime: $endTime)';
  }
}

/// @nodoc
@JsonSerializable()
class _OrderCreate implements OrderCreate {
  _OrderCreate(
      {required this.title,
      this.description,
      @JsonKey(name: 'image_url') this.imageUrl,
      required this.price,
      required this.address,
      @JsonKey(name: 'begin_time') required this.beginTime,
      @JsonKey(name: 'end_time') required this.endTime});
  factory _OrderCreate.fromJson(Map<String, dynamic> json) =>
      _$OrderCreateFromJson(json);

  @override
  final String title;
  @override
  final String? description;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  final double price;
  @override
  final String address;
  @override
  @JsonKey(name: 'begin_time')
  final DateTime beginTime;
  @override
  @JsonKey(name: 'end_time')
  final DateTime endTime;

  @override
  Map<String, dynamic> toJson() {
    return _$OrderCreateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderCreate &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.beginTime, beginTime) ||
                other.beginTime == beginTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, imageUrl,
      price, address, beginTime, endTime);

  @override
  String toString() {
    return 'OrderCreate(title: $title, description: $description, imageUrl: $imageUrl, price: $price, address: $address, beginTime: $beginTime, endTime: $endTime)';
  }
}

/// @nodoc
mixin _$OrderUpdate {
  String? get title;
  String? get description;
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  double? get price;
  String? get address;
  @JsonKey(name: 'begin_time')
  DateTime? get beginTime;
  @JsonKey(name: 'end_time')
  DateTime? get endTime;

  /// Serializes this OrderUpdate to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderUpdate &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.beginTime, beginTime) ||
                other.beginTime == beginTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, imageUrl,
      price, address, beginTime, endTime);

  @override
  String toString() {
    return 'OrderUpdate(title: $title, description: $description, imageUrl: $imageUrl, price: $price, address: $address, beginTime: $beginTime, endTime: $endTime)';
  }
}

/// @nodoc
@JsonSerializable()
class _OrderUpdate implements OrderUpdate {
  _OrderUpdate(
      {this.title,
      this.description,
      @JsonKey(name: 'image_url') this.imageUrl,
      this.price,
      this.address,
      @JsonKey(name: 'begin_time') this.beginTime,
      @JsonKey(name: 'end_time') this.endTime});
  factory _OrderUpdate.fromJson(Map<String, dynamic> json) =>
      _$OrderUpdateFromJson(json);

  @override
  final String? title;
  @override
  final String? description;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  final double? price;
  @override
  final String? address;
  @override
  @JsonKey(name: 'begin_time')
  final DateTime? beginTime;
  @override
  @JsonKey(name: 'end_time')
  final DateTime? endTime;

  @override
  Map<String, dynamic> toJson() {
    return _$OrderUpdateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderUpdate &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.beginTime, beginTime) ||
                other.beginTime == beginTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, imageUrl,
      price, address, beginTime, endTime);

  @override
  String toString() {
    return 'OrderUpdate(title: $title, description: $description, imageUrl: $imageUrl, price: $price, address: $address, beginTime: $beginTime, endTime: $endTime)';
  }
}

// dart format on
