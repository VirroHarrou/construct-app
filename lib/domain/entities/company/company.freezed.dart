// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Company {
  String get id;
  String get name;
  String get inn;

  /// Serializes this Company to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Company &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.inn, inn) || other.inn == inn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, inn);

  @override
  String toString() {
    return 'Company(id: $id, name: $name, inn: $inn)';
  }
}

/// @nodoc
@JsonSerializable()
class _Company implements Company {
  _Company({required this.id, required this.name, required this.inn});
  factory _Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String inn;

  @override
  Map<String, dynamic> toJson() {
    return _$CompanyToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Company &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.inn, inn) || other.inn == inn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, inn);

  @override
  String toString() {
    return 'Company(id: $id, name: $name, inn: $inn)';
  }
}

/// @nodoc
mixin _$CompanyCreate {
  String get name;
  String get inn;

  /// Serializes this CompanyCreate to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CompanyCreate &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.inn, inn) || other.inn == inn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, inn);

  @override
  String toString() {
    return 'CompanyCreate(name: $name, inn: $inn)';
  }
}

/// @nodoc
@JsonSerializable()
class _CompanyCreate implements CompanyCreate {
  _CompanyCreate({required this.name, required this.inn});
  factory _CompanyCreate.fromJson(Map<String, dynamic> json) =>
      _$CompanyCreateFromJson(json);

  @override
  final String name;
  @override
  final String inn;

  @override
  Map<String, dynamic> toJson() {
    return _$CompanyCreateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompanyCreate &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.inn, inn) || other.inn == inn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, inn);

  @override
  String toString() {
    return 'CompanyCreate(name: $name, inn: $inn)';
  }
}

/// @nodoc
mixin _$CompanyUpdate {
  String? get name;
  String? get inn;

  /// Serializes this CompanyUpdate to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CompanyUpdate &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.inn, inn) || other.inn == inn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, inn);

  @override
  String toString() {
    return 'CompanyUpdate(name: $name, inn: $inn)';
  }
}

/// @nodoc
@JsonSerializable()
class _CompanyUpdate implements CompanyUpdate {
  _CompanyUpdate({this.name, this.inn});
  factory _CompanyUpdate.fromJson(Map<String, dynamic> json) =>
      _$CompanyUpdateFromJson(json);

  @override
  final String? name;
  @override
  final String? inn;

  @override
  Map<String, dynamic> toJson() {
    return _$CompanyUpdateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompanyUpdate &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.inn, inn) || other.inn == inn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, inn);

  @override
  String toString() {
    return 'CompanyUpdate(name: $name, inn: $inn)';
  }
}

// dart format on
