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
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @JsonKey(name: 'logo_url')
  String? get logoUrl;
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
  @JsonKey(name: 'connected_user_ids')
  List<String> get connectedUserIds;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderCopyWith<Order> get copyWith =>
      _$OrderCopyWithImpl<Order>(this as Order, _$identity);

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
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.beginTime, beginTime) ||
                other.beginTime == beginTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.viewed, viewed) || other.viewed == viewed) &&
            const DeepCollectionEquality()
                .equals(other.connectedUserIds, connectedUserIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      imageUrl,
      logoUrl,
      status,
      price,
      address,
      beginTime,
      endTime,
      userId,
      viewed,
      const DeepCollectionEquality().hash(connectedUserIds));

  @override
  String toString() {
    return 'Order(id: $id, title: $title, description: $description, imageUrl: $imageUrl, logoUrl: $logoUrl, status: $status, price: $price, address: $address, beginTime: $beginTime, endTime: $endTime, userId: $userId, viewed: $viewed, connectedUserIds: $connectedUserIds)';
  }
}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) =
      _$OrderCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'logo_url') String? logoUrl,
      String? status,
      double price,
      String address,
      @JsonKey(name: 'begin_time') DateTime beginTime,
      @JsonKey(name: 'end_time') DateTime endTime,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'views_count') int viewed,
      @JsonKey(name: 'connected_user_ids') List<String> connectedUserIds});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res> implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? logoUrl = freezed,
    Object? status = freezed,
    Object? price = null,
    Object? address = null,
    Object? beginTime = null,
    Object? endTime = null,
    Object? userId = null,
    Object? viewed = null,
    Object? connectedUserIds = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _self.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      beginTime: null == beginTime
          ? _self.beginTime
          : beginTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      viewed: null == viewed
          ? _self.viewed
          : viewed // ignore: cast_nullable_to_non_nullable
              as int,
      connectedUserIds: null == connectedUserIds
          ? _self.connectedUserIds
          : connectedUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Order implements Order {
  _Order(
      {required this.id,
      required this.title,
      this.description,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'logo_url') this.logoUrl,
      this.status,
      required this.price,
      required this.address,
      @JsonKey(name: 'begin_time') required this.beginTime,
      @JsonKey(name: 'end_time') required this.endTime,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'views_count') this.viewed = 0,
      @JsonKey(name: 'connected_user_ids')
      final List<String> connectedUserIds = const <String>[]})
      : _connectedUserIds = connectedUserIds;
  factory _Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'logo_url')
  final String? logoUrl;
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
  final List<String> _connectedUserIds;
  @override
  @JsonKey(name: 'connected_user_ids')
  List<String> get connectedUserIds {
    if (_connectedUserIds is EqualUnmodifiableListView)
      return _connectedUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_connectedUserIds);
  }

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderCopyWith<_Order> get copyWith =>
      __$OrderCopyWithImpl<_Order>(this, _$identity);

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
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.beginTime, beginTime) ||
                other.beginTime == beginTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.viewed, viewed) || other.viewed == viewed) &&
            const DeepCollectionEquality()
                .equals(other._connectedUserIds, _connectedUserIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      imageUrl,
      logoUrl,
      status,
      price,
      address,
      beginTime,
      endTime,
      userId,
      viewed,
      const DeepCollectionEquality().hash(_connectedUserIds));

  @override
  String toString() {
    return 'Order(id: $id, title: $title, description: $description, imageUrl: $imageUrl, logoUrl: $logoUrl, status: $status, price: $price, address: $address, beginTime: $beginTime, endTime: $endTime, userId: $userId, viewed: $viewed, connectedUserIds: $connectedUserIds)';
  }
}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) =
      __$OrderCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'logo_url') String? logoUrl,
      String? status,
      double price,
      String address,
      @JsonKey(name: 'begin_time') DateTime beginTime,
      @JsonKey(name: 'end_time') DateTime endTime,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'views_count') int viewed,
      @JsonKey(name: 'connected_user_ids') List<String> connectedUserIds});
}

/// @nodoc
class __$OrderCopyWithImpl<$Res> implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? logoUrl = freezed,
    Object? status = freezed,
    Object? price = null,
    Object? address = null,
    Object? beginTime = null,
    Object? endTime = null,
    Object? userId = null,
    Object? viewed = null,
    Object? connectedUserIds = null,
  }) {
    return _then(_Order(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _self.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      beginTime: null == beginTime
          ? _self.beginTime
          : beginTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      viewed: null == viewed
          ? _self.viewed
          : viewed // ignore: cast_nullable_to_non_nullable
              as int,
      connectedUserIds: null == connectedUserIds
          ? _self._connectedUserIds
          : connectedUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
mixin _$OrderCreate {
  String get title;
  String? get description;
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @JsonKey(name: 'logo_url')
  String? get logoUrl;
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
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.beginTime, beginTime) ||
                other.beginTime == beginTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, imageUrl,
      logoUrl, price, address, beginTime, endTime);

  @override
  String toString() {
    return 'OrderCreate(title: $title, description: $description, imageUrl: $imageUrl, logoUrl: $logoUrl, price: $price, address: $address, beginTime: $beginTime, endTime: $endTime)';
  }
}

/// @nodoc
@JsonSerializable()
class _OrderCreate implements OrderCreate {
  _OrderCreate(
      {required this.title,
      this.description,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'logo_url') this.logoUrl,
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
  @JsonKey(name: 'logo_url')
  final String? logoUrl;
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
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.beginTime, beginTime) ||
                other.beginTime == beginTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, imageUrl,
      logoUrl, price, address, beginTime, endTime);

  @override
  String toString() {
    return 'OrderCreate(title: $title, description: $description, imageUrl: $imageUrl, logoUrl: $logoUrl, price: $price, address: $address, beginTime: $beginTime, endTime: $endTime)';
  }
}

/// @nodoc
mixin _$OrderUpdate {
  String? get title;
  String? get description;
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @JsonKey(name: 'logo_url')
  String? get logoUrl;
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
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.beginTime, beginTime) ||
                other.beginTime == beginTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, imageUrl,
      logoUrl, price, address, beginTime, endTime);

  @override
  String toString() {
    return 'OrderUpdate(title: $title, description: $description, imageUrl: $imageUrl, logoUrl: $logoUrl, price: $price, address: $address, beginTime: $beginTime, endTime: $endTime)';
  }
}

/// @nodoc
@JsonSerializable()
class _OrderUpdate implements OrderUpdate {
  _OrderUpdate(
      {this.title,
      this.description,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'logo_url') this.logoUrl,
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
  @JsonKey(name: 'logo_url')
  final String? logoUrl;
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
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.beginTime, beginTime) ||
                other.beginTime == beginTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, imageUrl,
      logoUrl, price, address, beginTime, endTime);

  @override
  String toString() {
    return 'OrderUpdate(title: $title, description: $description, imageUrl: $imageUrl, logoUrl: $logoUrl, price: $price, address: $address, beginTime: $beginTime, endTime: $endTime)';
  }
}

// dart format on
