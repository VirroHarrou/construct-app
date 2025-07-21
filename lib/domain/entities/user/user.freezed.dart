// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {
  String get id;
  String get fio;
  String get phone;
  String get address;
  String get inn;
  String? get description;
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  Company? get company;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fio, fio) || other.fio == fio) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.inn, inn) || other.inn == inn) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.company, company) || other.company == company));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, fio, phone, address, inn,
      description, imageUrl, company);

  @override
  String toString() {
    return 'User(id: $id, fio: $fio, phone: $phone, address: $address, inn: $inn, description: $description, imageUrl: $imageUrl, company: $company)';
  }
}

/// @nodoc
@JsonSerializable()
class _User implements User {
  _User(
      {required this.id,
      required this.fio,
      required this.phone,
      required this.address,
      required this.inn,
      this.description,
      @JsonKey(name: 'image_url') this.imageUrl,
      this.company});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  final String id;
  @override
  final String fio;
  @override
  final String phone;
  @override
  final String address;
  @override
  final String inn;
  @override
  final String? description;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  final Company? company;

  @override
  Map<String, dynamic> toJson() {
    return _$UserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fio, fio) || other.fio == fio) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.inn, inn) || other.inn == inn) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.company, company) || other.company == company));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, fio, phone, address, inn,
      description, imageUrl, company);

  @override
  String toString() {
    return 'User(id: $id, fio: $fio, phone: $phone, address: $address, inn: $inn, description: $description, imageUrl: $imageUrl, company: $company)';
  }
}

/// @nodoc
mixin _$UserCreate {
  String get fio;
  String get phone;
  String get address;
  String get inn;
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  String get password;

  /// Serializes this UserCreate to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserCreate &&
            (identical(other.fio, fio) || other.fio == fio) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.inn, inn) || other.inn == inn) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fio, phone, address, inn, imageUrl, password);

  @override
  String toString() {
    return 'UserCreate(fio: $fio, phone: $phone, address: $address, inn: $inn, imageUrl: $imageUrl, password: $password)';
  }
}

/// @nodoc
@JsonSerializable()
class _UserCreate implements UserCreate {
  _UserCreate(
      {required this.fio,
      required this.phone,
      required this.address,
      required this.inn,
      @JsonKey(name: 'image_url') this.imageUrl,
      required this.password});
  factory _UserCreate.fromJson(Map<String, dynamic> json) =>
      _$UserCreateFromJson(json);

  @override
  final String fio;
  @override
  final String phone;
  @override
  final String address;
  @override
  final String inn;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  final String password;

  @override
  Map<String, dynamic> toJson() {
    return _$UserCreateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserCreate &&
            (identical(other.fio, fio) || other.fio == fio) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.inn, inn) || other.inn == inn) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fio, phone, address, inn, imageUrl, password);

  @override
  String toString() {
    return 'UserCreate(fio: $fio, phone: $phone, address: $address, inn: $inn, imageUrl: $imageUrl, password: $password)';
  }
}

/// @nodoc
mixin _$UserUpdate {
  String? get fio;
  String? get phone;
  String? get address;
  String? get description;
  String? get password;
  @JsonKey(name: 'image_url')
  String? get imageUrl;

  /// Serializes this UserUpdate to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserUpdate &&
            (identical(other.fio, fio) || other.fio == fio) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, fio, phone, address, description, password, imageUrl);

  @override
  String toString() {
    return 'UserUpdate(fio: $fio, phone: $phone, address: $address, description: $description, password: $password, imageUrl: $imageUrl)';
  }
}

/// @nodoc
@JsonSerializable()
class _UserUpdate implements UserUpdate {
  _UserUpdate(
      {this.fio,
      this.phone,
      this.address,
      this.description,
      this.password,
      @JsonKey(name: 'image_url') this.imageUrl});
  factory _UserUpdate.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateFromJson(json);

  @override
  final String? fio;
  @override
  final String? phone;
  @override
  final String? address;
  @override
  final String? description;
  @override
  final String? password;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @override
  Map<String, dynamic> toJson() {
    return _$UserUpdateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserUpdate &&
            (identical(other.fio, fio) || other.fio == fio) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, fio, phone, address, description, password, imageUrl);

  @override
  String toString() {
    return 'UserUpdate(fio: $fio, phone: $phone, address: $address, description: $description, password: $password, imageUrl: $imageUrl)';
  }
}

// dart format on
